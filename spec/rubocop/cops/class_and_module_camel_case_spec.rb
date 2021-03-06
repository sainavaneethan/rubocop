# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    describe ClassAndModuleCamelCase do
      let (:camel_case) { ClassAndModuleCamelCase.new }

      it 'registers an offence for underscore in class and module name' do
        inspect_source(camel_case, 'file.rb',
                       ['class My_Class',
                        'end',
                        '',
                        'module My_Module',
                        'end',
                       ])
        camel_case.offences.map(&:message).should ==
          ['Use CamelCase for classes and modules.'] * 2
      end

      it 'accepts CamelCase names' do
        inspect_source(camel_case, 'file.rb',
                       ['class MyClass',
                        'end',
                        '',
                        'module Mine',
                        'end',
                       ])
        camel_case.offences.map(&:message).should == []
      end
    end
  end
end
