# Calendar Importer - plugin for redmine project management software
# Copyright (C) 2007-2012  Blend Interactive
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

# Empty redmine plguin
require 'redmine'
# TODO: Change this to use the name of your plugin
RAILS_DEFAULT_LOGGER.info 'Starting Calendar Import plugin for RedMine'

# TODO: Change the name 
Redmine::Plugin.register :calendar_import do
  name 'Calendar Import'
  author 'Blend Interactive'
  description 'This to allow users to create time entries and issues directly from the calendar system they are using.'
  version '0.1.0'

  menu(:top_menu, :calendar_imports, {:controller => "calendar_imports", :action => 'index'}, :caption => 'Calendar Import', :if => Proc.new{ User.current.logged? })
end

require 'dispatcher'
Dispatcher.to_prepare :calendar_import_plugin do
  require_dependency 'principal'
  require_dependency 'user'
  require_dependency 'project'
  User.send(:include,UserCalendarsPatch)
  Project.send(:include,ProjectPatch)
end

