tomcat-role
=================
[![Circle CI](https://circleci.com/gh/daniel-rhoades/tomcat-role.svg?style=svg&circle-token=a5a237c5743c1ed05e5d3f0c3f6710152e9991fc)](https://circleci.com/gh/daniel-rhoades/tomcat-role)

Ansible role for installing a configurable version of Apache Tomcat, following best practices of separating CATALINA_BASE directory from CATALINA_HOME.

This role will allow you to provide your application WAR and other configuration at start-up.  The target purpose of this role is to be used inside a (Docker) container.

The following options are available to you:

* Any WARs placed in `tomcat_system_home/distributions` be copied to `tomcat_catalina_base`, inside a container these can arrive either by
 * Mounting `tomcat_system_home/distributions` to suitable directory on the host machine (containing the WARs);
 * Providing a URL to a single WAR via the `WEBAPP_DISTRO_URL` environment variable; 
* Any scripts in `tomcat_catalina_base/environment` will be executed before Tomcat starts (via `setenv.sh`).

Requirements
------------
None

Role Variables
--------------
- tomcat_download_mirror: Download mirror site for the Tomcat distro
- tomcat_majorversion: Tomcat major version, e.g. 8.x.x (default "8")
- tomcat_minorversion: Tomcat minor version, e.g. x.0.x (default "0")
- tomcat_patchversion: Tomcat patch version, e.g. x.x.30 (default "30")
- tomcat_download_path: Path within the instance being configured as to where Tomcat will be downloaded into (default "/tmp")
- tomcat_remove_archive: Boolean property, if "true" the Tomcat archive will be deleted after it has been extracted (default "true")
- tomcat_system_user: System user that will run Tomcat (default "cms")
- tomcat_system_group: System user group that will run Tomcat (default "cms")
- tomcat_system_home: Home directory of the system user that will run Tomcat (default "/opt/{{ tomcat_system_user }}")
- tomcat_catalina_home: Directory where Tomcat will be extracted into (default "/usr/local/tomcat")
- tomcat_catalina_base: Directory which will hold custom Tomcat config (default "{{ tomcat_system_home }}/tomcat")

Dependencies
------------
Note, Oracle JDK 8 is required to be installed before installing this role, for an appropriate role see [williamyeh.oracle-java](https://github.com/William-Yeh/ansible-oracle-java).

Example Playbook
----------------
For a usage example see [hippo-tomcat-template](https://github.com/daniel-rhoades/hippo-tomcat-template).

License
-------
MIT

Author Information
------------------
Daniel Rhoades (https://github.com/daniel-rhoades)
