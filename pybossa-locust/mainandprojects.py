from locust import HttpLocust, TaskSet, task

class UserBehavior(TaskSet):
    def on_start(self):
        """ on_start is called when a Locust start before any task is scheduled """
        self.login()

    def login(self):
        # do a login here
        # self.client.post("/login", {"username":"ellen_key", "password":"education"})
        pass

    @task(2)
    def index(self):
        self.client.get("/")

    @task(1)
    def project1(self):
        self.client.get("/app/category/featured/")

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait=5000
    max_wait=9000