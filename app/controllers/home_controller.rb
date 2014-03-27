class HomeController < ApplicationController
  def index
    @lettings = Letting.all
    @featured_lettings = Letting.where('featured = ?', true)
  end
  
  def contact_us
    unless request.get?
      if !params[:fname].to_s.blank? and !params[:email].to_s.blank?
        if AdminMailer.send_contact(params[:fname], params[:email], params[:website], params[:message]).deliver
          flash[:notice] = "Your contact sent successfully."
          params[:fname] = params[:email] = params[:website] = params[:message] = " "
        else
          flash[:error] = "contact sending failed. Please try again."
        end
      else
        flash[:error] = "Name and Email cann't blank. Please try again."
      end
    end
  end
  
  def lettings
    response = HTTParty.get('http://ashtons.landmax.pro/api/lettings') 
    if response["success"] == true
      response['rows'].each do |rs|
        unless Letting.exists?(:letting_uid => rs['id'])
          letting = Letting.create(:letting_uid => rs['id'], :letting_proposal => rs['lettingProposal'], :title => rs["title"], :price => rs["price"], :property_short_description => rs["propertyShortDescription"], :proposal_description => rs["proposalDescription"], :bedroom_count => rs['bedroomCount'], :available_from => rs['availableFrom'], :property_category => rs['propertyCategory'], :address_line1 => rs['address']['line1'], :address_line2 => rs['address']['line2'], :town => rs['address']['town'], :area => rs['address']['area'], :country => rs['address']['country'], :post_code => rs['address']['postCode'], :latitude => rs['address']['coordinates']['latitude'], :longitude => rs['address']['coordinates']['longitude'], :price_type => rs['priceType'], :deposit_amount => rs['depositAmount'], :featured => rs['featured'], :publish_as => rs['publishAs'])
          rs['photos'].each do |ph|
            Photo.create(:imageable_id => letting.id, :imageable_type => 'letting', :description => ph['description'], :image => ph['url'])
          end
        end
      end
      flash[:notice] = "Scraping data has been updated successfully."
    else
      flash[:error] = "Scraping data updated failed. Please try again."
    end
    redirect_to "/"
  end
  
  def pro_lettings
    @lettings = Letting.all
  end
  
  def pro_sale
    @lettings = Letting.all
  end
  
  def search
    @lettings = Letting.location(params[:location]).status(params[:status]).property(params[:type]).rooms(params[:bed]).price(params["min-price"], params["max-price"])
  end
end
