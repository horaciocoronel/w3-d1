class Book
@@on_shelf = []
@@on_loan = []
def due_date
  @due_date
end
def due_date=
  @due_date
end

  def initialize(title, author, isbn)
    @book_title = title
    @author = author
    @isbn = isbn
  end
#Class Methods
  def self.create
    @@on_shelf << Book.new()
    return @@on_shelf[-1]
  end
  def self.available
    return @@on_shelf
  end
  def self.borrowed
    return @@on_loan
  end
  def browse
    return @@on_shelf.sample
  end
  def current_due_date
    Time.now + (2*7*24*60*60)
  end
  def self.overdue

  end
#Instance Methods
  def lent_out?
    @@on_loan.include?(self)
  end
  def borrow
    if self.lent_out?
      return false
    else
      @due_date = current_due_date
      return true
    end
  end
  def return_to_library
    if self.lent_out?
      @@on_loan.delete(self)
      @@on_shelf << self
      @due_date = nil
      return true
    else
      return false
    end
  end
end #Class ends
