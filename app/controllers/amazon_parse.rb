  def amazon_parse(response)
    
    response.items.each do |res|
      asin = res.get('ASIN')
      @item = Item.find_or_initialize_by(asin: asin)

      #if @item.new_record?
        #binding.pry
        @item.category_id = res.get('BrowseNodes/BrowseNode/BrowseNodeId') if res.get('BrowseNodes/BrowseNode/BrowseNodeId').present?
        @item.category_name = res.get('BrowseNodes/BrowseNode/Name') if res.get('BrowseNodes/BrowseNode/Name').present?
        @item.asin = res.get('ASIN') if res.get('ASIN').present? 
        @item.ean = res.get('ItemAttributes/EAN') if res.get('ItemAttributes/EAN').present?
        @item.title = res.get('ItemAttributes/Title') if res.get('ItemAttributes/Title').present?
        @item.color = res.get('ItemAttributes/Color') if res.get('ItemAttributes/Color').present?
        @item.model = res.get('ItemAttributes/Model') if res.get('ItemAttributes/Model').present?
        @item.partnumber = res.get('ItemAttributes/PartNumber') if res.get('ItemAttributes/PartNumber').present?
        @item.brand = res.get('ItemAttributes/Brand') if res.get('ItemAttributes/Brand').present?
        @item.manufacture = res.get('ItemAttributes/Manufacturer') if res.get('ItemAttributes/Manufacturer').present?
        #binding.pry
        @item.durl = res.get('DetailPageURL') if res.get('DetailPageURL').present?
        @item.small_image = res.get("SmallImage/URL") if res.get("SmallImage/URL").present?
        @item.midium_image  = res.get("MediumImage/URL") if res.get("MediumImage/URL").present?
        @item.large_image = res.get("LargeImage/URL") if res.get("LargeImage/URL").present?
        @item.salesrank =res.get('ItemAttributes/SalesRank') if res.get('ItemAttributes/SalesRank').present?
        feature1 =""
        feature1 = res.get('ItemAttributes/Feature[1]') if res.get('ItemAttributes/Feature[1]').present?
        feature2 =""
        feature2 = res.get('ItemAttributes/Feature[2]') if res.get('ItemAttributes/Feature[2]').present?
        feature3 =""
        feature3 = res.get('ItemAttributes/Feature[3]') if res.get('ItemAttributes/Feature[3]').present?
        feature4 =""
        feature4 = res.get('ItemAttributes/Feature[4]') if res.get('ItemAttributes/Feature[4]').present?
        @item.feature = feature1 + feature2 + feature3 + feature4

        editorialreviews1 =""
        editorialreviews1 = res.get('EditorialReviews/EditorialReview[1]') if res.get('EditorialReviews/EditorialReview[1]').present?
        editorialreviews2 =""
        editorialreviews2 = res.get('EditorialReviews/EditorialReview[2]') if res.get('EditorialReviews/EditorialReview[2]').present?
        editorialreviews3 =""
        editorialreviews3 = res.get('EditorialReviews/EditorialReview[3]') if res.get('EditorialReviews/EditorialReview[3]').present?
        @item.editorialreviews = editorialreviews1 + editorialreviews1 + editorialreviews2 + editorialreviews3
        
        @item.pkg_height_inc = res.get('ItemAttributes/PackageDimensions/Height') if res.get('ItemAttributes/PackageDimensions/Height').present?
        @item.pkg_length_inc = res.get('ItemAttributes/PackageDimensions/Length') if res.get('ItemAttributes/PackageDimensions/Length').present?
        #binding.pry
        @item.pkg_width_inc = res.get('ItemAttributes/PackageDimensions/Width') if res.get('ItemAttributes/PackageDimensions/Width').present?

        @item.list_price = res.get('ItemAttributes/ListPrice/Amount') if  res.get('ItemAttributes/ListPrice/Amount').present? #参考価格 定価
        @item.price = res.get('Offers/Offer/OfferListing/Price/Amount') if  res.get('Offers/Offer/OfferListing/Price/Amount').present? #表示価格
        @item.amount_savd = res.get('Offers/Offer/OfferListing/AmountSaved/Amount') if res.get('Offers/Offer/OfferListing/AmountSaved/Amount').present? #割引額
        @item.availabilityattributes = res.get('Offers/Offer/OfferListing/AvailabilityAttributes/AvailabilityType') if res.get('Offers/Offer/OfferListing/AvailabilityAttributes/AvailabilityType').present? #在庫状況
        
        @item.save!

      #end
          

    end
  end