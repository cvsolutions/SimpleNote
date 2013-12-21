function NotesCtrlAjax($scope, $http) {
    $http({method: 'POST', url: '/load.json'}).success(function (data) {
        $scope.notes = data;
    });
}