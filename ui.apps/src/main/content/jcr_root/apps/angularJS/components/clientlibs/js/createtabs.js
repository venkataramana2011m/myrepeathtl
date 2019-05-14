
var app = angular.module('angularintegrationwithcq', ['ui.bootstrap']);

app.controller('AppCtrl', ['$scope', function ($scope) {
  var counter = 1;

  $scope.tabs = [];

  var initHighlight = function () {
    var x, y,
        bgMoz, bgWebKit, bgAll,
        originalBG = '#c3d5e6';

    angular.element('.nav-tabs li').unbind();
    angular.element('.nav-tabs li')
      .removeAttr('style')
      .mousemove(function(e) {

        if($(this).hasClass('active'))
          return;

        x = e.pageX - this.offsetLeft;
        y = e.pageY - this.offsetTop;

        bgMoz    = '-moz-radial-gradient(circle at ' + x + 'px ' + y + 'px, rgba(255,255,255,0.4) 0px, rgba(255,255,255,0.0) 45px), ' + originalBG;
        bgWebKit = '-webkit-radial-gradient(circle at ' + x + 'px ' + y + 'px, rgba(255,255,255,0.4) 0px, rgba(255,255,255,0.0) 45px), ' + originalBG;
        bgAll    = 'radial-gradient(circle at ' + x + 'px ' + y + 'px, rgba(255,255,255,0.4) 0px, rgba(255,255,255,0.0) 45px), ' + originalBG;

        $(this)
          .css({ background: bgMoz })
          .css({ background: bgWebKit })
          .css({ background: bgAll });

      }).mouseout(function() {
        $(this).removeAttr('style');
      });
  };

  $scope.removeTab = function ($event, $index) {
    $event.preventDefault();
    $event.stopPropagation();
    $scope.tabs.splice($index, 1);
  };

  var addTab = function () {
    $scope.tabs.push({ title: 'Tab ' + counter, content: 'Tab ' + counter });
    counter++;
    $scope.tabs[$scope.tabs.length - 1].active = true;
  };

  var tabChange = function () {
    initHighlight();
  };

  for (var i = 0; i < 5; i++) {
    addTab();
  }
  
  $scope.addTab = addTab;
  $scope.tabChange = tabChange;

  var friends = element.all(by.repeater('friend in friends'));

    it('should render initial data set', function() {
      expect(friends.count()).toBe(10);
      expect(friends.get(0).getText()).toEqual('[1] John who is 25 years old.');
      expect(friends.get(1).getText()).toEqual('[2] Jessie who is 30 years old.');
      expect(friends.last().getText()).toEqual('[10] Samantha who is 60 years old.');
      expect(element(by.binding('friends.length')).getText())
          .toMatch("I have 10 friends. They are:");
    });

     it('should update repeater when filter predicate changes', function() {
       expect(friends.count()).toBe(10);

       element(by.model('q')).sendKeys('ma');

       expect(friends.count()).toBe(2);
       expect(friends.get(0).getText()).toEqual('[1] Mary who is 28 years old.');
       expect(friends.last().getText()).toEqual('[2] Samantha who is 60 years old.');
     });

}]);
