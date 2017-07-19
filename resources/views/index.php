<html>
    <head>

        <meta name="viewport" content="width=device-width, user-scalable=false;">
        <link rel="stylesheet" href="public/js/bower_components/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="public/js/main.css">
        <link rel="stylesheet" href="public/js/app/components/menu/menu.css">
        <link rel="stylesheet" href="public/js/app/components/home/home.css">
        <link rel="stylesheet" href="public/js/app/components/article/article.css">
        <link rel="stylesheet" href="public/js/app/components/categorie/categorie.css">
        <link rel="stylesheet" href="public/js/app/components/login/login.css">


        <!-- load dependencies -->
        <script src="public/js/bower_components/angular/angular.min.js"></script>
        <script src="public/js/bower_components/angular-ui-router/release/angular-ui-router.min.js"></script>
        <script src="public/js/bower_components/angular-animate/angular-animate.min.js"></script>
        <script src="public/js/bower_components/angular-touch/angular-touch.min.js"></script>
        <script src="public/js/bower_components/angular-ui-bootstrap/angular-ui-bootstrap.min.js"></script>
        <script src="public/js/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="public/js/bower_components/bootstrap/js/bootstrap.min.js"></script>


        <!-- load core angular app -->
        <script src="public/js/app/app.js"></script>
        <script src="public/js/app/app.service.js"></script>
        <script src="public/js/app/app.routes.js"></script>

        <!-- load angular app parts -->
        <script src="public/js/app/components/menu/menu.js"></script>
        <script src="public/js/app/components/blog/blog.js"></script>
        <script src="public/js/app/components/home/home.js"></script>
        <script src="public/js/app/components/article/article.js"></script>
        <script src="public/js/app/components/categorie/categorie.js"></script>
        <script src="public/js/app/components/login/login.js"></script>


    </head>

    <body ng-app="chineurs">
        <div ui-view></div>
    </body>
</html>