package app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
class ApplicationService {
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder encoder;

    @Autowired
    ApplicationService(
        UserRepository mockUserRepository
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
