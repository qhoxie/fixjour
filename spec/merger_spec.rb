require 'spec/spec_helper'

describe Fixjour::Merger do
  attr_reader :merger
  
  before(:each) do
    @merger = Fixjour::Merger.new(Foo, :name => "MERGED!")
  end
  
  describe "#new" do
    it "merges options with overrides" do
      mock.proxy(defaults = { :name => "Pat" }).merge(:name => "MERGED!")
      merger.new(defaults)
    end
    
    it "returns an instance of the klass with the merged options" do
      merger.new(:name => "Pat").should be_kind_of(Foo)
    end
  end

  describe "proxying to klass" do
    it "proxies other methods to klass" do
      merger.superclass.should == ActiveRecord::Base
    end
    
    it "proxies respond_to? to klass" do
      merger.should respond_to(:superclass)
    end
  end
end