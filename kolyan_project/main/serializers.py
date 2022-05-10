from .models import *
from rest_framework import serializers

class TrainNumberSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = TrainNumber
        fields = ['pk', 'url', 'route_number']


class TrainCategorySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = TrainCategory
        fields = ['pk', 'url', 'category_name']


class CarriageTypeSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = CarriageType
        fields = ['pk', 'url', 'carriage_category']


class TrainMovementSerializer(serializers.HyperlinkedModelSerializer):
    train_number = TrainNumberSerializer(many=False, read_only=True)
    train_category = TrainCategorySerializer(many=False, read_only=True)
    train_number_id = serializers.IntegerField(required=True)
    train_category_id = serializers.IntegerField(required=True)

    class Meta:
        model = TrainMovement
        fields = [
            'pk', 'url', 'train_number', 'train_category', 'station_name',
            'time_start', 'time_stop', 'is_end_station', 'train_number_id', 'train_category_id'
        ]
        write_only_fields = ['train_number_id', 'train_category_id']


    def create(self, validated_data):
        train_number = TrainNumber.objects.get(pk=validated_data['train_number_id'])
        train_category = TrainCategory.objects.get(pk=validated_data['train_category_id'])
        instance = TrainMovement.objects.create(**validated_data, train_number=train_number, train_category=train_category)
        return instance


class TrainCompositionSerializer(serializers.HyperlinkedModelSerializer):
    cariage = CarriageTypeSerializer(many=False, read_only=True)
    train_number = TrainNumberSerializer(many=False, read_only=True)
    cariage_id = serializers.IntegerField(required=True)
    train_number_id = serializers.IntegerField(required=True)


    class Meta:
        model = TrainComposition
        fields = [
            'pk',
            'url',
            'cariage_number',
            'train_number', 'cariage',
            'cariage_id', 'train_number_id'
        ]
        read_only_fields = ['train_number', 'cariage']
        write_only_fields = ['cariage_id', 'train_number_id']

