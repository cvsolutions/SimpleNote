<!doctype html>
<html lang="en" ng-app>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Note</title>
    <link rel="stylesheet" href="/files/bootstrap.css">
    <link rel="stylesheet" href="/files/layout.css">
</head>
<body>
<div class="container">

    <div class="row">
        <div class="col-lg-12">
            <p>&nbsp;</p>
        </div>
    </div>

    <div class="row">

        <div class="col-lg-4" ng-controller="NotesCtrlAjax">

            <div class="row">
                <div class="col-lg-12">
                    <div class="input-group">
                        <input type="text" ng-model="search.$" class="form-control">

                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Menu <span class="caret"></span></button>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="/">Aggiungi nota</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <p>&nbsp;</p>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    {literal}
                        <div class="list-group">
                            <a href="#" class="list-group-item active">al momento ci sono {{(notes|filter:search).length}} note</a>

                            <div class="scroll">
                                <a ng-repeat="row in notes | filter:search" href="/edit/{{row.id}}" class="list-group-item">{{row.fullname}}</a>
                            </div>
                        </div>
                    {/literal}
                </div>
            </div>

        </div>

        <div class="col-lg-8">
            {block name="panel"}{/block}
        </div>

    </div>

    <div class="row">
        <div class="col-lg-12">
            <p class="text-center">&copy; 2013 Simple Note</p>
        </div>
    </div>

</div>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="/files/bootstrap.js"></script>
<script src="/files/angular.min.js"></script>
<script src="/files/common.js"></script>
</body>
</html>