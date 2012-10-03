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

class UserToProjectMapping < ActiveRecord::Base
    belongs_to :user
    belongs_to :project
    validates_presence_of :project_id, :project_alias 

    validates_uniqueness_of :project_alias, :scope=> :user_id, :message=> 'must be unique.  You have already used this Project Alias.  Either pick a new one or go back and remove your previous project alias.'

end
