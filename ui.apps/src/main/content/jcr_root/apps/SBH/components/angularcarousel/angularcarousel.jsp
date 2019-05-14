<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>


<cq:includeClientLib categories="angularframeworkjs" />
<!doctype html>
<html ng-app="ui.bootstrap.demo">
  <head>


  </head>
  <body>

                    <%
                       String path = properties.get("images", currentPage.getPath());
					   int carouselspeed = properties.get("cspeed", 5000);
                       resource = resourceResolver.getResource(path);
                       Node node = WCMUtils.getNode(resource);
                       NodeIterator iterator = node.getNodes();

                    %>
        <script>
        angular.module('ui.bootstrap.demo', ['ui.bootstrap']);
        angular.module('ui.bootstrap.demo').controller('CarouselDemoCtrl', function ($scope) {
            $scope.myInterval =5000;
            //$scope.myInterval =parseInt("<%=carouselspeed%>",5000);
          var slides = $scope.slides = [];
          $scope.addSlide = function() {

               <% while(iterator.hasNext()) {
                            Node child = iterator.nextNode();%>
            slides.push({

                image: 'http://localhost:2974<%=child.getPath()%>/jcr:content/renditions/cq5dam.thumbnail.319.319.png?cq_ck=1410333104000' 


            });
				<%  } %>
          };
              /*for (var i=0; i<4; i++) {

            }*/
              $scope.addSlide();
        });
    </script>
      <br/>





<div ng-controller="CarouselDemoCtrl">
  <div style="height: 305px">
    <carousel interval="myInterval">
      <slide ng-repeat="slide in slides">
          <img ng-src="{{slide.image}}" style="margin:auto; width:500px; height:300px;" >
      </slide>
    </carousel>
  </div>
  <!--<div class="row">
    <div class="col-md-6">
      <button type="button" class="btn btn-info" ng-click="addSlide()">Add Slide</button>
    </div>
    <div class="col-md-6">
      Interval, in milliseconds: <input type="number" class="form-control" ng-model="myInterval">
      <br />Enter a negative number or 0 to stop the interval.
    </div>
  </div>-->
</div>
  </body>
</html>
