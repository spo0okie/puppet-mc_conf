#настройки MC по умолчанию
class mc_conf::default {
  include mc_conf
  mc_conf::hotlist {
    '/etc': ;
    '/var/log': ;
  }
}
