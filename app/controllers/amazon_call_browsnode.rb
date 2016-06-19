def amazon_call_browsnode(browsenode_id, item_page)
    Amazon::Ecs.item_search('', :search_index => 'Kitchen', :browse_node => browsenode_id, 
    :response_group=>"Large, BrowseNodes", :country => 'jp',   :sort => "salesrank", :item_page => item_page )
 end