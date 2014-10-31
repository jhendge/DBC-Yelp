require 'rails_helper'

describe Review do 

it {should belong_to(:user)}
it {should belog_to(:place)}
it {should have_many(:votes)}

end