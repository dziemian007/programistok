module WillPaginateExt
  def first_page?
    self.current_page == 1
  end
 
  def last_page?
    self.current_page == self.total_pages
  end
end
 
class WillPaginate::Collection
  include WillPaginateExt
end
