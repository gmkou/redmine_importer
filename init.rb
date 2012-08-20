require 'redmine'

Redmine::Plugin.register :redmine_importer do
  name 'Issue Importer'
  author 'Original: Martin Liu, Customized: Akiko Takano'
  description 'Issue import plugin for Redmine.'
  url 'https://github.com/akiko-pusu/redmine_importer'
  version '0.3.1'

  project_module :importer do
    permission :import, :importer => :index
    permission :match, :importer => :match
   
  end
  menu :project_menu, :importer, { :controller => 'importer', :action => 'index' }, :caption => :label_import, :before => :settings, :param => :project_id

  Rails.application.routes.draw do |map|
    map.connect 'projects/:project_id/importer/:action', :controller => 'importer'
  end
end
