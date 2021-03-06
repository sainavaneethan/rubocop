# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    describe TrailingWhitespace do
      let (:tws) { TrailingWhitespace.new }

      it 'registers an offence for a line ending with space' do
        source = ['x = 0 ']
        tws.inspect('file.rb', source, nil, nil)
        tws.offences.size.should == 1
      end

      it 'registers an offence for a line ending with tab' do
        tws.inspect('file.rb', ["x = 0\t"], nil, nil)
        tws.offences.size.should == 1
      end

      it 'accepts a line without trailing whitespace' do
        tws.inspect('file.rb', ["x = 0\n"], nil, nil)
        tws.offences.size.should == 0
      end
    end
  end
end
