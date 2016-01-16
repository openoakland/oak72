Included in this guide:
  * [About OAK72](#about_oak72)
  * [Production Deployment](#production_deployment)
  * [Development Environment Setup](#development-environment-setup)

# About OAK72

**OAK72 was derived from City72**. For more information about the toolkit, visit [toolkit.sf72.org](http://toolkit.sf72.org). The main differences between OAK72 and City72 are:

• OAK72 is abstracted so that all the strings (lines of text) come from a locale file, this is the first step in allowing toggling between different languages. Currently, the only complete file is English (en.yml) but other files exist and the site is a few features (and a significant contribution from translators) away from being viewable in Chinese, Spanish, English, Vietnamese and Filipino. NOTE: See the Translation Features issue for more details on this effort.
 
• OAK72 is minimally reliant on a content management system (CMS). Many sections of the CMS assumed that the site would exist in English only. All of those sections are no longer connected to the site and have been commented out from the views of the CMS and replaced with brief instructions on where to make changes.

• OAK72 is intended as a guide for getting prepared and connected. Any reference to checking back after an emergency has been changed or removed.

• City72 currently assumes that the site you are creating is for a city, OAK72 could easily be adapted for a county, organization or other community. NOTE: Deriving a site from OAK72 definitely requires some basic development skills (using Git, setting up a development environment, and making changes with a code editor).

• In OAK72, the main page headings are aligned in the lower right of the main image to make room for faces in photos. In City72, the headings are centered over the photo.

• OAK72 requires more technical know-how but offers more flexibility in terms of what can be customized. For instance, the images are not editable via the CMS, instead, they have very logical file names and should be replaced at the file level. While this is not as easy for anybody to do, it lets the photographer and designer have more control over the crop of images and the level to which they are optimized.

• Much of the content on OAK72 is only applicable to Oakland (e.g. portraits of residents). Any team wishing to fork OAK72 into another community preparedness site should prioritize the gathering of relevant photography. The same holds true for City72, except all of the content on City72 is unrestricted and aims to be more universal.


# Deploy on Heroku

You can deploy the app on Heroku by clicking the button below:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

If you don't have a Heroku account, you will be prompted to create one.

## Add-ons

The following free add-ons are automatically installed as part of set-up. Even though the add-ons are free, you have to verify your account by adding a credit card.

* **PostgreSQL** is the database for your application.
* **SendGrid** sends emails from your application (e.g. the forgot password email).
* **NewRelic** monitors your application performance
* **Cloudinary** resizes, crops and then stores the images in your application.

## Configure the recover password host redirection:

During setup, you will be prompted to enter a `EMAIL_REDIRECT_HOST`, used within the emails sent from your application. The value should be `YOURAPPNAME.herokuapp.com`

## Scale to 2 dynos

First, go to your Heroku account and create an application to be used for the project. When asked for the number of `web dynos` to be used in your application select `2`. There is a small monthly fee associated with having an extra dyno.

For testing purposes, you can choose an application with no extra dynos (this will be free). Please note that **sites with no extra dynos "go to sleep"** and can be slow to wake up. So, when you are ready to let the public use your site, make sure that your Heroku appliation has at least `2 dynos`. 
  
## FINAL STEP: Update your username and password via the Content Editor

Your site was installed with a default username and password (these are set in the db/seeds.rb file). Go to your app and login

`http://YOURAPPNAME.herokuapp.com/cms`

The default username and password are:

`admin@example.com`

`password`

Once you login, use the Admin menu in the navigation to change the email to your email address. Then you will need to change the password to a strong password that only you know.


---
  

# Development Environment Setup

In most cases you will not need to setup a development environment for this application. The only reason to go through the following steps would be if you wanted to customize your site beyond what you can set with the Content Editor.

## Prerequisites

To setup the application you will need:

* PostgreSQL database
* Ruby 1.9.3-p448
* Bundler gem
* Bower


### PostgreSQL installation

#### Linux

    $ sudo apt-get -y install postgresql

#### Mac OS X

    $ brew install postgresql

### Ruby Installation

#### Rbenv

To install ruby, it is necessary to have *rbenv* installed. This can be installed following the steps described in [rbenv's Github Repository](https://github.com/sstephenson/rbenv), in the [Installation Section](https://github.com/sstephenson/rbenv#installation).

#### Ruby 1.9.3-p448

When rbenv is already installed, go to the project's root folder, and run the following command

```sh
 $ rbenv install
```

### Bundler gem
In order the manage the project dependencies, it is necessary to have installed *bundler*.

```sh
 $ gem install bundler
```

### Bower
To manage the client-side js dependencies, it is necessary to have installed *bower*. *Bower* depends on *node.js*, so if it is not installed yet, install it with *nvm*, following these instructions: [NVM - Installation guide](https://github.com/creationix/nvm#installation).

Having *node.js* installed, run the following command to install *bower*:

```sh
npm install -g bower
```

## Development environment

Before running the app, the following steps should be performed.
* Obtain a copy of the application
* Create the database user for the application
* Install the application dependencies
* Create the database
* Download the client-side dependecies

### Obtain a copy of the application

Clone the code to your computer.
The command you type into your shell application (Terminal on the Mac) will be:

```sh
$ git clone https://github.com/city72/city-72.git
```

This will create a directory named `city-72`.

### Create the database user for the application

```sh
createuser -P -s city72
```
Assign the word *city72* as password too.

Linux users should run the above command as postgres user (`sudo su postgres`).

### Install the application dependencies

```sh
bundle install
```

### Create the database

```sh
bundle exec rake db:setup
```

### Download the client-side dependencies

```sh
bower install
```

## Run the application locally
With all the prerequisites and the development environment ready. Just run the app, with the following command:

```sh
bundle exec rails s
```

## Open your application on Port 3000

Go to your browser and open 

```sh
localhost:3000
```

