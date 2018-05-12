Madness - Instant Markdown Server
==================================================

[![Gem Version](https://badge.fury.io/rb/madness.svg)](https://badge.fury.io/rb/madness)
[![Build Status](https://travis-ci.com/DannyBen/madness.svg?branch=master)](https://travis-ci.com/DannyBen/madness)
[![Maintainability](https://api.codeclimate.com/v1/badges/fa440dc4dbf895734d74/maintainability)](https://codeclimate.com/github/DannyBen/madness/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/fa440dc4dbf895734d74/test_coverage)](https://codeclimate.com/github/DannyBen/madness/test_coverage)

---


Screenshot
--------------------------------------------------

![screenshot]



Install
--------------------------------------------------

    $ gem install madness



Design Intentions
--------------------------------------------------

Madness was designed in order to provide easy browsing, viewing and 
searching for local, markdown based documentation directories.



Feature Highlights
--------------------------------------------------

- Easy to use
- Built in full text search
- Compatible with how markdown files are displayed on GitHub andGitHub pages.
- Configure with a configuration file or command arguments



Usage
--------------------------------------------------

Go to any directory that contains markdown files and run:

    $ madness

For more options, run:

    $ madness --help



Directory Conventions
--------------------------------------------------

Madness expects to be executed in a documentation directory.

A documentation directory contains only markdown files (`*.md`) and 
sub directories that contain more markdown files.

The server will consider the file `README.md` in any directory as the 
main file describing this directory.

The navigation sidebar will show all the sub directories and files in 
the same directory as the viewed file.

Example structure:

```
./
├── README.md
├── File.md
├── Another File.md
├── File-with-Dashes.md
├── Folder
│   ├── File.md
│   └── image.png
└── Another Folder
    ├── README.md
    └── File.md
```



Configuration File
--------------------------------------------------

All the command line arguments can also be configured through a 
configuration file. Create a file named `.madness.yml` in your 
documentation directory, and modify any of the settings below.

```yaml
# .madness.yml
---
path: '.'
port: '3000'
bind: '0.0.0.0'
autoh1: true
highlighter: true
line_numbers: true
index: false
```



Search
--------------------------------------------------

Madness comes with a full text search page. To activate it, you need to
generate a search index by running `madness --index` or 
`madness path/to/docs --index`.

This will create an `_index` sub folder, and will add a new search page
to your documentation server.

You will need to run this command from time to time, as your 
documents change or new documents are added.



Images and Static Files
--------------------------------------------------

You can put images and any other asset file anywhere in your documentation 
folder.

When linking to other pages or images in your documentation folder, simply
use the URL relative to the markdown file. 

For example, if you have a folder named `subfolder` that contains a 
`README.md` and a `nice-picture.png`, showing it in your `README` is done by
this markdown:

```markdown
![alt text](nice-picture.png)
```

If you wish to link to images or pages in a different folder, simply specify
the path relative to the homepage:

```
![alt text](/images/nice-picture.png)
```



Automatic H1
--------------------------------------------------

If your markdown document does not start with a level 1 heading, it
will be automatically added based on the file name.



Hidden Directories
--------------------------------------------------

These directories will not be displayed in the navigation:

- Directories that begin with an underscore.
- Directories that are made only of lowercase letters, underscoew, dash and/or 
  numbers (`/^[a-z_\-0-9]+$/`).



Changing Theme
--------------------------------------------------

To change the CSS of your documentation server:

- Create a directory named `css` in your root documentation directory.
- Copy the [main.css][css] file to it.
- Update it as you see fit.

Note that this functionality is not guaranteed to stay as is in future 
versions of madness, since support for themes is still not yet fully 
implemented.



Docker Image
--------------------------------------------------

Madness server is also available as a docker image.

This command will start the server on localhost:3000, with the current 
directory as the markdown documentation folder

```shell
$ docker run --rm -it -v $PWD:/docs -p 3000:3000 dannyben/madness
```

For more information see:

- [Madness image on Docker Hub][dockerhub]
- [Madness Dockerfile][dockerfile]



---

[screenshot]: https://raw.githubusercontent.com/DannyBen/madness/master/screenshot.png
[dockerhub]: https://hub.docker.com/r/dannyben/madness/
[dockerfile]: https://github.com/DannyBen/docker-madness
[css]: app/public/css/main.css

