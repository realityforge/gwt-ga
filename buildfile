require 'buildr/git_auto_version'

desc 'GWT Google Analytics Library'
define 'gwt-ga' do
  project.group = 'org.realityforge.gwt.ga'
  compile.options.source = '1.7'
  compile.options.target = '1.7'
  compile.options.lint = 'all'

  project.version = ENV['PRODUCT_VERSION'] if ENV['PRODUCT_VERSION']

  compile.with :javax_annotation,
               :gwt_user,
               :javax_inject,
               :google_guice

  package(:jar).tap do |jar|
    jar.include compile.sources, :as => '.'
  end

  iml.add_jruby_facet
end
