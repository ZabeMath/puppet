# == Function: role ( string $role_name )
# This will include class role::$role_name and set scope::_role to $role_name.
#
# https://github.com/wikimedia/puppet/blob/production/modules/wmflib/lib/puppet/functions/role.rb
Puppet::Functions.create_function(:role) do
  dispatch :main do
    param 'String', :main_role
  end
  def main(main_role)
    scope = closure_scope
    # Check if the function has already been called
    if scope.include? '_role'
      raise Puppet::ParseError, "role() can only be called once per node"
    end

    role = main_role.gsub(/^::/, '')

    # This is where we're going in the future
    # Hack: we transform 'foo::bar' in 'foo/bar' so that it's easy to lookup in hiera
    scope['_role'] = role.gsub(/::/, '/')
    rolename = 'role::' + role
    call_function('include', rolename)
  end
end
