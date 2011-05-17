jQuery-carousel
===============

Main goals of the project idea
------------------------------

#### Most of carousel plugins provides not enough funcionality to interact with them. They propose to use pre-configuration hashes to setup callbacks and other settings.

    $('.foo').carousel({
      'bar'     : good,
      'onCreate': function() {
        console.log('this is good features')
      }
    });

Instead of this plugin should has an some kind of api, that can be used in a dynamic way:

    var api = $('.foo').carousel({'bar': good}).data('carousel');
    api.dimension('vertical')
    api.remove()

#### Plugin should based on evented (like reactor) pattern, that allows to change any logic from outside:

For example we try to setup custom callback:

    $('.foo').carousel({
      'onCreate': function() {
        console.log('this is good features')
      }
    });

But when we needs to setup another callback.. we stuck. Instead of this I suggest event-based arcitecture:

    api.subscribe('create', function(carousel) {
      console.log('first callback')
    });
    api.subscribe('create', function(carousel) {
      console.log('second callback')
    });

Moreover we can rewrite base callback:

    api.bind('create', function(carousel) {
      console.log('our implementation of base callback, it's good for plugin');
    });

#### Plugin should be unobstructive and fully controlled:

    var api = $('.foo').carousel().data('carousel');
    api.disable()

#### I want to test it via jasmine

#### Plugin should allow to customize mark-up and its design via themes

    api.theme('dark-blue');

Developing
----------

Now rails need only as platform for developing. And I recommend to use rvm with individual gemset for this project, because of rails 3.1beta usage.

    rvm gemset create carousel
    rvm use 1.9.2-head@carousel
    gem install bundler --no-ri --no-rdoc
    babushka cheef:'latest coffee-script'
    babushka cheef:'sqlite3.gem'
    git clone https://cheef@github.com/cheef/jquery-carousel.git
    cd jquery-carousel
    bundle install

Use `http://localhost/carousel` to see demo



