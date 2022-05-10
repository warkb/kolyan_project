from rest_framework import viewsets
from rest_framework import permissions

from .serializers import *
from .models import *

class TrainNumberViewSet(viewsets.ModelViewSet):
    queryset = TrainNumber.objects.all()
    serializer_class = TrainNumberSerializer
    permission_classes = [permissions.AllowAny]

class TrainCategoryViewSet(viewsets.ModelViewSet):
    queryset = TrainCategory.objects.all()
    serializer_class = TrainCategorySerializer
    permission_classes = [permissions.AllowAny]

class CarriageTypeViewSet(viewsets.ModelViewSet):
    queryset = CarriageType.objects.all()
    serializer_class = CarriageTypeSerializer
    permission_classes = [permissions.AllowAny]

class TrainMovementViewSet(viewsets.ModelViewSet):
    queryset = TrainMovement.objects.all()
    serializer_class = TrainMovementSerializer
    permission_classes = [permissions.AllowAny]


class TrainCompositionViewSet(viewsets.ModelViewSet):
    queryset = TrainComposition.objects.all()
    serializer_class = TrainCompositionSerializer
    permission_classes = [permissions.AllowAny]
