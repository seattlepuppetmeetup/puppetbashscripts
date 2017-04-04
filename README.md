# puppetbashscripts

Portion of my bashrc related to working with puppet.  Defines a series of validation functions and some aliases.

# vyaml

Validate YAML file

## Multiple files

```
$ vyaml /etc/puppet/hieradata/common.yaml /etc/puppetlabs/code/hiera.yaml /tmp/hiera.yaml 
/etc/puppet/hieradata/common.yaml: Syntax Ok!
/etc/puppetlabs/code/hiera.yaml: Syntax Ok!
/tmp/hiera.yaml: /opt/puppetlabs/puppet/lib/ruby/2.1.0/psych.rb:370:in `parse': (/tmp/hiera.yaml): could not find expected ':' while scanning a simple key at line 14 column 3 (Psych::SyntaxError)
	from /opt/puppetlabs/puppet/lib/ruby/2.1.0/psych.rb:370:in `parse_stream'
	from /opt/puppetlabs/puppet/lib/ruby/2.1.0/psych.rb:318:in `parse'
	from /opt/puppetlabs/puppet/lib/ruby/2.1.0/psych.rb:245:in `load'
	from /opt/puppetlabs/puppet/lib/ruby/2.1.0/psych.rb:464:in `block in load_file'
	from /opt/puppetlabs/puppet/lib/ruby/2.1.0/psych.rb:464:in `open'
	from /opt/puppetlabs/puppet/lib/ruby/2.1.0/psych.rb:464:in `load_file'
	from -e:1:in `<main>'
Syntax Error!
```

## Single file
```
$ vyaml /etc/puppet/hieradata/common.yaml
Syntax Ok!
```

# vjson

Validate JSON

# vepp

Validate EPP Template

# verb

Validate ERB Template

# reyaml

Run a YAML file through Ruby's YAML parser, reformatting it in the process.
