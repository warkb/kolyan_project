from django.db import models

class TrainNumber(models.Model):
    route_number = models.IntegerField(null=False)

class TrainCategory(models.Model):
    category_name = models.CharField(max_length=255, null=False)

class CarriageType(models.Model):
    carriage_category = models.CharField(max_length=255, null=False)

class TrainMovement(models.Model):
    train_number = models.ForeignKey(TrainNumber, on_delete=models.CASCADE, null=False)
    train_category = models.ForeignKey(TrainCategory, on_delete=models.CASCADE, null=False)
    station_name = models.CharField(max_length=255, null=False)
    time_start = models.TimeField(null=True)
    time_stop = models.TimeField(null=True)
    is_end_station = models.BooleanField(null=False)


class TrainComposition(models.Model):
    cariage = models.ForeignKey(CarriageType, on_delete=models.CASCADE, null=False)
    train_number = models.ForeignKey(TrainNumber, on_delete=models.CASCADE, null=False)
    cariage_number = models.IntegerField(null=True)


