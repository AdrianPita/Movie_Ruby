require 'rspec'

describe "My awesome feature" do
	it "does true truthy" do
		expect(true).to eq(true)
	end

	it "performs additions really well" do
		expect(1+2).to eq(3)
	end

	it "puts items in an array" do
		expect(['one']).to include('one')
	end
end
