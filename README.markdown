jQuery-carousel
===============

Main goals of the project idea
------------------------------

1. Most of carousel plugins provides not enough funcionality to interact with them. They propose to use pre-configuration hashes to setup callbacks and other settings:


    $('.foo').carousel({ 'bar': good, 'onCreate': function() {} });

But we offen needs an api, which can be helpfull to use plugin dynamicaly:

    var api = $('.foo').carousel({'bar': good}).data('carousel');
    api.next();
    api.subscribe('onCreate', function() {});

2. Plugin should based on evented (like reactor) pattern, that allows to change any logic from outside:


    var api = $('.foo').carousel().data('carousel');
    api.subscribe('next', function() {});
    api.bind('previous',  function() {});

3. Plugin should be unobstructive and fully controlled:


    var api = $('.foo').carousel().data('carousel');
    api.disable()





