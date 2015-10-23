(function () {

  'use strict';

  angular.module('app.additionalDetails')
    .directive('addlDetails', addlDetails);

  addlDetails.$inject = ['MLRest'];

  function addlDetails(mlRest) {
    return {
      restrict: 'E',
      templateUrl: 'app/detail/addl-details.html',
      scope: {
                guid: '@'
             },
      link: function(scope, iElement, iAttrs, ctrl) {
        mlRest.extension('additional-details',
          {
            method: 'GET',
            params:
              {
                'rs:guid': scope.guid
              }
          })
          .then(function(response) {
            scope.details = response.data;
          });
      }
    };
  }

}());
