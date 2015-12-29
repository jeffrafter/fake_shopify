class App < ActiveRecord::Base
  PROXY_PATH_PREFIXES = [
    :apps,
    :a,
    :community,
    :tools,
  ]

  PROXY_SUBPATH_BLACKLIST = [
    :admin,
    :services,
    :password,
    :login
  ]

end
