package app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
class UserService {
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder encoder;

    @Autowired
    UserService(
        UserRepository mockUserRepository,
        BCryptPasswordEncoder encoder
    ) {
        this.userRepository = mockUserRepository;
        this.encoder = encoder;
    }

    void createUser(User user) {
        String hash = encoder.encode(user.getPassword());
        user.setPassword(hash);
        userRepository.save(user);
    }
}
