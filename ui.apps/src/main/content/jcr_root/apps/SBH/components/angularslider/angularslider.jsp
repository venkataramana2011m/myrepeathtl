<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<%
                       String path = properties.get("images", currentPage.getPath());
                       resource = resourceResolver.getResource(path);
                       Node node = WCMUtils.getNode(resource);
                       NodeIterator iterator = node.getNodes();
                       while(iterator.hasNext()) {
                            Node child = iterator.nextNode();
%>
<% 
                       }
%>
<cq:includeClientLib categories="angularframeworkjs" />
<!doctype html>
<html ng-app="ui.bootstrap.demo">
  <head>
	<script>
        angular.module('ui.bootstrap.demo', ['ui.bootstrap']);
        angular.module('ui.bootstrap.demo').controller('CarouselDemoCtrl', function ($scope) {
          $scope.myInterval = 500;
          var slides = $scope.slides = [];
          $scope.addSlide = function() {
            
            slides.push({
              image: "<%=path%>" + newWidth + '/300',
              text: ['More','Extra','Lots of','Surplus'][slides.length % 4] + ' ' +
                ['Cats', 'Kittys', 'Felines', 'Cutes'][slides.length % 4]
            });
          };
          for (var i=0; i<4; i++) {
            $scope.addSlide();
          }
        });
    </script>

  </head>
  <body>

<div ng-controller="CarouselDemoCtrl">
  <div style="height: 305px">
    <carousel interval="myInterval">
      <slide ng-repeat="slide in slides" active="slide.active">
        <img ng-src="{{slide.image}}" style="margin:auto;">
        <div class="carousel-caption">
          <h4>Slide {{$index}}</h4>
          <p>{{slide.text}}</p>
        </div>
      </slide>
    </carousel>
  </div>
  <div class="row">
    <div class="col-md-6">
      <button type="button" class="btn btn-info" ng-click="addSlide()">Add Slide</button>
    </div>
    <div class="col-md-6">
      Interval, in milliseconds: <input type="number" class="form-control" ng-model="myInterval">
      <br />Enter a negative number or 0 to stop the interval.
    </div>
  </div>
</div>


        
                                <img src="<%=child.getPath()%>" style="width:150px; height:100px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;" onclick="fnshowImg(this.src);">

        
                    <%  } %>
  </body>
</html>
