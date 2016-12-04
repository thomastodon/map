package app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
class UserService {
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder encoder;

<<<<<<< Updated upstream:backend/src/main/java/app/ApplicationService.java
    @Autowired
    ApplicationService(
        UserRepository mockUserRepository
=======
    UserService(
        UserRepository mockUserRepository,
        BCryptPasswordEncoder encoder
>>>>>>> Stashed changes:backend/src/main/java/app/UserService.java
    ) {
        this.userRepository = mockUserRepository;
        this.encoder = new BCryptPasswordEncoder();
    }

    void createUser(User user) {
        String hash = encoder.encode(user.getPassword());
        user.setPassword(hash);
        userRepository.save(user);
    }
}
