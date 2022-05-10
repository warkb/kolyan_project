from django.urls import include, path
from rest_framework import routers
from . import views

router = routers.DefaultRouter()

router.register(r'train-number', views.TrainNumberViewSet)
router.register(r'train-category', views.TrainCategoryViewSet)
router.register(r'cariage-type', views.CarriageTypeViewSet)
router.register(r'train-movement', views.TrainMovementViewSet)
router.register(r'train-composition', views.TrainCompositionViewSet)

urlpatterns = [
    path('api/', include(router.urls)),
]
