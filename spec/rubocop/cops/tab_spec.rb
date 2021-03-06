# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    describe Tab do
      let (:tab) { Tab.new }

      it 'registers an offence for a line indented with tab' do
        tab.inspect('file.rb', ["\tx = 0"], nil, nil)
        tab.offences.size.should == 1
      end

      it 'accepts a line with tab in a string' do
        tab.inspect('file.rb', [%Q(x = "\t")], nil, nil)
        tab.offences.size.should == 0
      end
    end
  end
end
