from rest_framework import routers

from polls.viewsets import QuestionViewSet

router = routers.DefaultRouter()
router.register(r'questions', QuestionViewSet)