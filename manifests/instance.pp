# This defines an additional instance of sshd with a separate config and service
define ssh::instance(
  $sshd_config_port,
  $ensure                                 = 'present',
  $permit_root_login                      = 'yes',
  $sshd_config_path                       = "/etc/ssh/sshd_config.${title}",
  $sshd_config_owner                      = 'root',
  $sshd_config_group                      = 'root',
  $sshd_config_loglevel                   = 'INFO',
  $sshd_config_mode                       = 'USE_DEFAULTS',
  $sshd_config_permitemptypasswords       = undef,
  $sshd_config_permituserenvironment      = undef,
  $sshd_config_compression                = undef,
  $sshd_config_syslog_facility            = 'AUTH',
  $sshd_config_template                   = 'ssh/sshd_config.erb',
  $sshd_config_login_grace_time           = '120',
  $sshd_config_challenge_resp_auth        = 'yes',
  $sshd_config_print_motd                 = 'yes',
  $sshd_config_print_last_log             = undef,
  $sshd_config_use_dns                    = 'USE_DEFAULTS',
  $sshd_config_authkey_location           = undef,
  $sshd_config_strictmodes                = undef,
  $sshd_config_serverkeybits              = 'USE_DEFAULTS',
  $sshd_config_banner                     = 'none',
  $sshd_config_ciphers                    = undef,
  $sshd_config_kexalgorithms              = undef,
  $sshd_config_macs                       = undef,
  $sshd_config_allowgroups                = [],
  $sshd_config_allowusers                 = [],
  $sshd_config_denygroups                 = [],
  $sshd_config_denyusers                  = [],
  $sshd_config_maxauthtries               = undef,
  $sshd_config_maxstartups                = undef,
  $sshd_config_maxsessions                = undef,
  $sshd_config_chrootdirectory            = undef,
  $sshd_config_forcecommand               = undef,
  $sshd_config_match                      = undef,
  $sshd_authorized_keys_command           = undef,
  $sshd_authorized_keys_command_user      = undef,
  $sshd_banner_content                    = undef,
  $sshd_banner_owner                      = 'root',
  $sshd_banner_group                      = 'root',
  $sshd_banner_mode                       = '0644',
  $sshd_config_xauth_location             = 'USE_DEFAULTS',
  $sshd_config_subsystem_sftp             = 'USE_DEFAULTS',
  $sshd_kerberos_authentication           = undef,
  $sshd_password_authentication           = 'yes',
  $sshd_allow_tcp_forwarding              = 'yes',
  $sshd_x11_forwarding                    = 'yes',
  $sshd_x11_use_localhost                 = 'yes',
  $sshd_use_pam                           = 'USE_DEFAULTS',
  $sshd_client_alive_count_max            = '3',
  $sshd_client_alive_interval             = '0',
  $sshd_gssapiauthentication              = 'yes',
  $sshd_gssapikeyexchange                 = 'USE_DEFAULTS',
  $sshd_pamauthenticationviakbdint        = 'USE_DEFAULTS',
  $sshd_gssapicleanupcredentials          = 'USE_DEFAULTS',
  $sshd_acceptenv                         = 'USE_DEFAULTS',
  $sshd_config_hostkey                    = 'USE_DEFAULTS',
  $sshd_listen_address                    = undef,
  $sshd_hostbasedauthentication           = 'no',
  $sshd_pubkeyacceptedkeytypes            = undef,
  $sshd_pubkeyauthentication              = 'yes',
  $sshd_ignoreuserknownhosts              = 'no',
  $sshd_ignorerhosts                      = 'yes',
  $sshd_config_authenticationmethods      = undef,
  $sshd_config_tcp_keepalive              = undef,
  $sshd_config_use_privilege_separation   = undef,
  $sshd_config_permittunnel               = undef,
  $sshd_config_hostcertificate            = undef,
  $sshd_config_trustedusercakeys          = undef,
  $sshd_config_key_revocation_list        = undef,
  $sshd_config_authorized_principals_file = undef,
  $sshd_config_allowagentforwarding       = undef,
  $service_ensure                         = 'running',
  $service_name                           = $title,
  $service_enable                         = true,
  $service_hasrestart                     = true,
  $service_hasstatus                      = 'USE_DEFAULTS',
  $service_description                    = 'Additional SSH server',
  $service_env_file                       = '/etc/sysconfig/sshd',
  $service_options                        = "-f ${sshd_config_path}",
){
  require ssh::package

  ssh::sshd_config{"sshd_config.${title}" :
    sshd_config_path                       => $sshd_config_path,
    sshd_config_owner                      => $sshd_config_owner,
    sshd_config_group                      => $sshd_config_group,
    sshd_config_loglevel                   => $sshd_config_loglevel,
    sshd_config_mode                       => $sshd_config_mode,
    sshd_config_permitemptypasswords       => $sshd_config_permitemptypasswords,
    sshd_config_permituserenvironment      => $sshd_config_permituserenvironment,
    sshd_config_compression                => $sshd_config_compression,
    sshd_config_port                       => $sshd_config_port,
    sshd_config_syslog_facility            => $sshd_config_syslog_facility,
    sshd_config_template                   => $sshd_config_template,
    sshd_config_login_grace_time           => $sshd_config_login_grace_time,
    sshd_config_challenge_resp_auth        => $sshd_config_challenge_resp_auth,
    sshd_config_print_motd                 => $sshd_config_print_motd,
    sshd_config_print_last_log             => $sshd_config_print_last_log,
    sshd_config_use_dns                    => $sshd_config_use_dns,
    sshd_config_authkey_location           => $sshd_config_authkey_location,
    sshd_config_strictmodes                => $sshd_config_strictmodes,
    sshd_config_serverkeybits              => $sshd_config_serverkeybits,
    sshd_config_banner                     => $sshd_config_banner,
    sshd_config_ciphers                    => $sshd_config_ciphers,
    sshd_config_kexalgorithms              => $sshd_config_kexalgorithms,
    sshd_config_macs                       => $sshd_config_macs,
    sshd_config_allowgroups                => $sshd_config_allowgroups,
    sshd_config_allowusers                 => $sshd_config_allowusers,
    sshd_config_denygroups                 => $sshd_config_denygroups,
    sshd_config_denyusers                  => $sshd_config_denyusers,
    sshd_config_maxauthtries               => $sshd_config_maxauthtries,
    sshd_config_maxstartups                => $sshd_config_maxstartups,
    sshd_config_maxsessions                => $sshd_config_maxsessions,
    sshd_config_chrootdirectory            => $sshd_config_chrootdirectory,
    sshd_config_forcecommand               => $sshd_config_forcecommand,
    sshd_config_match                      => $sshd_config_match,
    sshd_authorized_keys_command           => $sshd_authorized_keys_command,
    sshd_authorized_keys_command_user      => $sshd_authorized_keys_command_user,
    sshd_banner_content                    => $sshd_banner_content,
    sshd_banner_owner                      => $sshd_banner_owner,
    sshd_banner_group                      => $sshd_banner_group,
    sshd_banner_mode                       => $sshd_banner_mode,
    sshd_config_xauth_location             => $sshd_config_xauth_location,
    sshd_config_subsystem_sftp             => $sshd_config_subsystem_sftp,
    sshd_kerberos_authentication           => $sshd_kerberos_authentication,
    sshd_password_authentication           => $sshd_password_authentication,
    sshd_allow_tcp_forwarding              => $sshd_allow_tcp_forwarding,
    sshd_x11_forwarding                    => $sshd_x11_forwarding,
    sshd_x11_use_localhost                 => $sshd_x11_use_localhost,
    sshd_use_pam                           => $sshd_use_pam,
    sshd_client_alive_count_max            => $sshd_client_alive_count_max,
    sshd_client_alive_interval             => $sshd_client_alive_interval,
    sshd_gssapiauthentication              => $sshd_gssapiauthentication,
    sshd_gssapikeyexchange                 => $sshd_gssapikeyexchange,
    sshd_pamauthenticationviakbdint        => $sshd_pamauthenticationviakbdint,
    sshd_gssapicleanupcredentials          => $sshd_gssapicleanupcredentials,
    sshd_acceptenv                         => $sshd_acceptenv,
    sshd_config_hostkey                    => $sshd_config_hostkey,
    sshd_listen_address                    => $sshd_listen_address,
    sshd_hostbasedauthentication           => $sshd_hostbasedauthentication,
    sshd_pubkeyacceptedkeytypes            => $sshd_pubkeyacceptedkeytypes,
    sshd_pubkeyauthentication              => $sshd_pubkeyauthentication,
    sshd_ignoreuserknownhosts              => $sshd_ignoreuserknownhosts,
    sshd_ignorerhosts                      => $sshd_ignorerhosts,
    sshd_config_authenticationmethods      => $sshd_config_authenticationmethods,
    sshd_config_tcp_keepalive              => $sshd_config_tcp_keepalive,
    sshd_config_use_privilege_separation   => $sshd_config_use_privilege_separation,
    sshd_config_permittunnel               => $sshd_config_permittunnel,
    sshd_config_hostcertificate            => $sshd_config_hostcertificate,
    sshd_config_trustedusercakeys          => $sshd_config_trustedusercakeys,
    sshd_config_key_revocation_list        => $sshd_config_key_revocation_list,
    sshd_config_authorized_principals_file => $sshd_config_authorized_principals_file,
    sshd_config_allowagentforwarding       => $sshd_config_allowagentforwarding,
  }

  ssh::service_instance{$title:
    ensure              => $ensure,
    service_name        => $service_name,
    service_description => $service_description,
    service_env_file    => $service_env_file,
    service_options     => $service_options,
  }

  if $ensure == 'present' {
    ssh::service{$title:
      service_ensure     => $service_ensure,
      service_enable     => $service_enable,
      service_name       => $service_name,
      service_hasrestart => $service_hasrestart,
      service_hasstatus  => $service_hasstatus_real,
      service_subscribe  => File["sshd_config.${title}"]
    }
  } else {
    service{$title:
      ensure => 'stopped',
      enable => false,
    }
  }
}