yamljam
=======

jam your yaml
=======

This gem provides a way to jam files matching, currently, a very specific pattern into one file. Run it from a directory containing another directory containing yaml files, and it will merge them into one. for example, if you have:

en/homepage.yml

en/products.yml

en/about.yml

it will merge all of these into an en.yml file with the keys from the other yaml files included under the newly created en namespace. This is a work in progress and does not work recursively through directories yet, and is missing any kind of knobs and tweaks. Pull requests are welcome.