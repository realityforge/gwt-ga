require 'buildr/git_auto_version'
require 'buildr/gpg'

desc 'GWT Google Analytics Library'
define 'gwt-ga' do
  project.group = 'org.realityforge.gwt.ga'
  compile.options.source = '1.7'
  compile.options.target = '1.7'
  compile.options.lint = 'all'

  project.version = ENV['PRODUCT_VERSION'] if ENV['PRODUCT_VERSION']

  pom.add_apache_v2_license
  pom.add_github_project('realityforge/gwt-ga')
  pom.add_developer('realityforge', 'Peter Donald')
  pom.provided_dependencies.concat [:javax_annotation, :javax_inject]

  compile.with :javax_annotation,
               :gwt_user,
               :google_guice,
               :javax_inject

  package(:jar).include("#{_(:source, :main, :java)}/*")
  package(:sources)
  package(:javadoc)

  iml.add_jruby_facet
end
