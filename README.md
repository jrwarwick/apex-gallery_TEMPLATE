# Oracle has moved the APEX gallery
 to be a dynamic, in-the-cloud resource by way of a (central) structured github.com repository.
In an act of mimicry (and in hopes of a future official option to include/merge in custom-corporate structured repositories), here is a sort of "gallery repository template".
Somewhat stripped down and hopefully suitable for a fork/clone with your company name/abbreviation as a suffix.

If you choose to clone this template and populate it with your own works, a few items to modify to get a more complete experience:
- docs/manifest.json (just a manual effort for now, TODO: fancy json-in-the-DB query against APEX dictionary views to generate this).
- replace all instances of __AUTHOR__ throughout docs, readmes, copyright notices, etc.
- repo hyperlink in header-nav of docs/index.html
- alter manifestURL in function loadContent() in docs/js/core.js to point to your repo. Mind the version-number-branches (i.e., either create them or omit it from the formula)

Note that the "main" and the version branches' contents have been sort of smashed together in this template; in cases of less complex and sophisticated private/customer galleries, it should ease some of the up front burden, but it may have some clean-up/re-synch repercussions in the future if the repo structures or export layout change.

# Based on [Oracle APEX on GitHub](https://oracle.github.io/apex/)

This GitHub project contains starter apps, sample apps, templates, demonstrations, sample code, and plug-ins that you can use with [Oracle APEX](https://apex.oracle.com/).

## Branches
These branches contains starter apps, sample apps and so on for a specific version of Oracle APEX.

- [Oracle APEX 22.1](../../tree/22.1)
- [Oracle APEX 21.2](../../tree/21.2)
- [Oracle APEX 21.1](../../tree/21.1)

## Getting Started
Get started with APEX and the code samples found in this project by requesting your own workspace on [apex.oracle.com](https://apex.oracle.com/en/learn/getting-started/).

## Documentation
Review the [Oracle APEX online documentation](https://docs.oracle.com/en/database/oracle/application-express/index.html).

## Contributing
This project welcomes contributions, but on a discretionary basis. Before submitting a pull request, please [review our contribution guide](./CONTRIBUTING.md).

## License
Copyright (c) 2022 by __AUTHOR__.

Released under the Universal Permissive License v1.0 as shown at
<https://oss.oracle.com/licenses/upl/>.
