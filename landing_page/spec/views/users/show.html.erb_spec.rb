require 'rails_helper'

describe "users/show.html.erb" do

    context "when the user has data" do 

        it "displays a users profile correctly" do
            assign(:user, build(:user, first_name: "Test", second_name: "Meh", email: "test@meh.com"))

            render

            expect(rendered).to have_content("Test")
            expect(rendered).to have_content("Meh")
            expect(rendered).to have_content("test@meh.com")
            expect(rendered).to_not have_content("Greetings!")
        end
    end

    context "when the user has no data" do

        it "doesn't display content" do
            assign(:user, build(:user, first_name: "", second_name: "", email: ""))

            render

            expect(rendered).to have_content(nil)
            expect(rendered).to_not have_content("test@meh.com")
        end
    end
end
