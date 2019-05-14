<%@include file="/libs/foundation/global.jsp" %>
<cq:includeClientLib categories="cq.widgets" />  
<html ng>
    <head>
    	<title>Hello AngularJS !!!</title>
    
    </head>
    <body ng-app="angularintegrationwithcq" style="background-color:white;">
        <h1>Hello AngularJS!!!</h1>
        <h2>This page contains Angular JS functionality</h2>

        <div >
             <p>Enter a value: <input type="text" ng-model="name"></p>
             <p ng-bind="name"></p>
            Hello <span ng-bind="name"></span>!

        </div>

		<div ng-controller="AppCtrl">
                <tabset class="tab-container">
                      <tab ng-repeat="tab in tabs" select="tabChange()" active="tab.active" disabled="tab.disabled">
                        <tab-heading>
                          <span>{{tab.title}}</span> <i class="glyphicon glyphicon-remove" ng-click="removeTab($event, $index)"></i>
                        </tab-heading>
                        <h1>{{tab.content}}</h1>
                      </tab>
                      <button class="btn btn-default" ng-click="addTab()"></button>
    		   </tabset>
        </div>


			<div ng-init="friends = [
              {name:'John', age:25, gender:'boy'},
              {name:'Jessie', age:30, gender:'girl'},
              {name:'Johanna', age:28, gender:'girl'},
              {name:'Joy', age:15, gender:'girl'},
              {name:'Mary', age:28, gender:'girl'},
              {name:'Peter', age:95, gender:'boy'},
              {name:'Sebastian', age:50, gender:'boy'},
              {name:'Erika', age:27, gender:'girl'},
              {name:'Patrick', age:40, gender:'boy'},
              {name:'Samantha', age:60, gender:'girl'}
            ]">
              I have {{friends.length}} friends. They are:
              <input type="search" ng-model="q" placeholder="filter friends..." />
              <ul class="example-animate-container">
                <li class="animate-repeat" ng-repeat="friend in friends | filter:q as results">
                  [{{$index + 1}}] {{friend.name}} who is {{friend.age}} years old.
                </li>
                <li class="animate-repeat" ng-if="results.length == 0">
                  <strong>No results found...</strong>
                </li>
              </ul>
            </div>
    </body>
</html>