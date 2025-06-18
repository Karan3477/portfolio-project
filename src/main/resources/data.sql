-- Clear existing data
DELETE FROM skills;
DELETE FROM projects;
DELETE FROM about;
DELETE FROM contacts;
DELETE FROM personal_info;

-- Sample data for personal_info table
INSERT INTO personal_info (name, title, location, email, phone, bio, linkedin, github, twitter, portfolio, image_url) 
VALUES (
    'Karan Dodis',
    'Full Stack Developer',
    'Mumbai Thane, India',
    'dodiskaran7@gmail.com',
    '+91 7620162307',
    'Hi, I''m a passionate Full Stack Developer with expertise in Java, Spring Boot, Angular, and MySQL. I specialize in building scalable web applications with clean code and user-friendly design. I thrive on transforming ideas into robust digital solutions.',
    'https://www.linkedin.com/in/karan-dodis-a399a527b',
    'https://github.com/Karan3477',
    'https://twitter.com/karandodis',
    'https://karandodis.dev',
    'assets/images/profile.jpg'
);

-- Insert Skills
INSERT INTO skills (name, category, icon, description, color) VALUES
-- Frontend Skills
('Angular', 'frontend', 'fab fa-angular', 'Modern frontend framework for building scalable applications', '#DD0031'),
-- ('React', 'frontend', 'fab fa-react', 'Popular JavaScript library for building user interfaces', '#61DAFB'),
('TypeScript', 'frontend', 'fab fa-js', 'Typed superset of JavaScript for better development experience', '#3178C6'),
('HTML5/CSS3', 'frontend', 'fab fa-html5', 'Core web technologies for structure and styling', '#E34F26'),
('SASS/SCSS', 'frontend', 'fab fa-sass', 'CSS preprocessor for better styling workflow', '#CC6699'),

-- Backend Skills
('Spring Boot', 'backend', 'fas fa-leaf', 'Java framework for building microservices', '#6DB33F'),
-- ('Node.js', 'backend', 'fab fa-node-js', 'JavaScript runtime for server-side development', '#339933'),
-- ('Express.js', 'backend', 'fas fa-server', 'Web application framework for Node.js', '#000000'),
('Java', 'backend', 'fab fa-java', 'Object-oriented programming language', '#007396'),
-- ('Python', 'backend', 'fab fa-python', 'Versatile programming language for various applications', '#3776AB'),

-- Database Skills
('MySQL', 'database', 'fas fa-database', 'Relational database management system', '#4479A1'),
-- ('PostgreSQL', 'database', 'fas fa-database', 'Advanced open-source database', '#336791'),
-- ('MongoDB', 'database', 'fas fa-database', 'NoSQL document database', '#47A248'),
-- ('Redis', 'database', 'fas fa-database', 'In-memory data structure store', '#DC382D'),

-- Tools Skills
('Git', 'tools', 'fab fa-git-alt', 'Version control system', '#F05032'),
('Docker', 'tools', 'fab fa-docker', 'Containerization platform', '#2496ED'),
('AWS', 'tools', 'fab fa-aws', 'Cloud computing platform', '#FF9900'),
('Jenkins', 'tools', 'fas fa-cogs', 'Continuous integration tool', '#D24939'),

-- Soft Skills
('Problem Solving', 'soft', 'fas fa-puzzle-piece', 'Analytical thinking and solution design', '#9B59B6'),
('Team Leadership', 'soft', 'fas fa-users', 'Leading and motivating development teams', '#3498DB'),
('Communication', 'soft', 'fas fa-comments', 'Effective verbal and written communication', '#2ECC71'),
('Time Management', 'soft', 'fas fa-clock', 'Efficient project and task management', '#F39C12');

-- Insert Projects
INSERT INTO projects (title, description, image_url, github_url, live_url, technologies, category) VALUES
('Portfolio Website', 'A full-stack portfolio website built with Angular and Spring Boot', 'assets/images/portfolio.jpg', 'https://github.com/karandodis/portfolio', 'https://karandodis.dev', 'Angular, Spring Boot, MySQL', 'web'),
('E-commerce Platform', 'Online shopping platform with user authentication and payment integration', 'assets/images/ecommerce.jpg', 'https://github.com/karandodis/ecommerce', 'https://ecommerce-demo.com', 'React, Node.js, MongoDB', 'web'),
('Task Management App', 'Collaborative task management application with real-time updates', 'assets/images/taskmanager.jpg', 'https://github.com/karandodis/taskmanager', 'https://taskmanager-demo.com', 'Angular, Spring Boot, PostgreSQL', 'web'),
-- ('Fitness Tracker Mobile App', 'Mobile app for tracking workouts, nutrition, and fitness progress', 'assets/images/fitness.jpg', 'https://github.com/karandodis/fitness-tracker', 'https://fitness-tracker-demo.com', 'React Native, Firebase, Redux', 'mobile'),
-- ('Weather Application', 'Real-time weather application with location-based forecasts', 'assets/images/weather.jpg', 'https://github.com/karandodis/weather-app', 'https://weather-app-demo.com', 'JavaScript, OpenWeather API, CSS', 'other'),
-- ('Recipe Finder', 'Recipe discovery app with search and filtering capabilities', 'assets/images/recipe.jpg', 'https://github.com/karandodis/recipe-finder', 'https://recipe-finder-demo.com', 'Angular, Node.js, MongoDB', 'web');

-- Insert About Information
INSERT INTO about (name, title, bio, image_url) VALUES
('Karan Dodis', 'Full Stack Developer', 'Passionate developer with expertise in building modern web applications. Experienced in both frontend and backend technologies.', 'assets/images/profile.jpg');

-- Insert Contact Information
INSERT INTO contacts (email, phone, location, linkedin_url, github_url) VALUES
('dodiskaran7@gmail.com', '+91 7620162307', 'Mumbai Thane, India', 'https://www.linkedin.com/in/karan-dodis-a399a527b', 'https://github.com/Karan3477');

USE portfolio;
SELECT * FROM skills;
SELECT * FROM projects;
SELECT * FROM about;
SELECT * FROM contacts; 