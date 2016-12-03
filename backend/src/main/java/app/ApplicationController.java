package app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
class ApplicationController {

    private ApplicationService applicationService;

    @Autowired
    ApplicationController(ApplicationService applicationService) {
        this.applicationService = applicationService;
    }

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public ResponseEntity postUser(
        @RequestBody User user
    ) {
        applicationService.createUser(user);
        return new ResponseEntity(HttpStatus.CREATED);
    }

}
