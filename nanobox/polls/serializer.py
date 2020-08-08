from rest_framework import serializers

# Serializers define the API representation.
from polls.models import Question


class QuestionSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Question
        fields = ['question_text', 'pub_date']

