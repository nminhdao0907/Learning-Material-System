-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: group6_lms
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `answer_content` varchar(255) DEFAULT NULL,
  `is_correct` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (21,21,'Ranked',1,NULL,NULL,NULL,NULL),(22,21,'Redundant',1,NULL,NULL,NULL,NULL),(23,21,'Consistent',0,NULL,NULL,NULL,NULL),(24,21,'Verifiable',0,NULL,NULL,NULL,NULL),(25,22,'Ranking of features is done based on business value, technical value, risk management or strategic fitness',0,NULL,NULL,NULL,NULL),(26,22,' Lowest ranking items are decomposed into smaller stories during release planning so that they can be completed in future iterations',1,NULL,NULL,NULL,NULL),(27,22,'Highest ranking items are decomposed into smaller stories during release planning so that they can be completed in future iterations',0,NULL,NULL,NULL,NULL),(28,22,'Multiple teams can work on a single product backlog',0,NULL,NULL,NULL,NULL),(29,22,'Each product should have one product backlog which can have a set of large to very large features',0,NULL,NULL,NULL,NULL),(30,23,'Technical documentation',0,NULL,NULL,NULL,NULL),(31,23,'User document',0,NULL,NULL,NULL,NULL),(32,23,'Software design documentation',0,NULL,NULL,NULL,NULL),(33,23,'Requirement documentation',1,NULL,NULL,NULL,NULL),(34,24,'Submit multiple changes at one time',0,NULL,NULL,NULL,NULL),(35,24,'Open and honest communication',0,NULL,NULL,NULL,NULL),(36,24,'Give overviews of the changes',1,NULL,NULL,NULL,NULL),(37,24,'Hold change meetings',0,NULL,NULL,NULL,NULL),(38,25,'Understanding of the business area that the project is involved with',0,NULL,NULL,NULL,NULL),(39,25,'Understanding of the agile development process',0,NULL,NULL,NULL,NULL),(40,25,'Ability to facilitate a team to consensus on scope, design decisions, and implementation decisions',0,NULL,NULL,NULL,NULL),(41,25,'All of the mentioned',1,NULL,NULL,NULL,NULL),(42,25,'Ability to document requirements formally or informally depending on the need of the project',0,NULL,NULL,NULL,NULL),(43,26,'Stakeholders',0,NULL,NULL,NULL,NULL),(44,26,'The operational environment',0,NULL,NULL,NULL,NULL),(45,26,'Application domain specialists',0,NULL,NULL,NULL,NULL),(46,26,'The organizational environment',1,NULL,NULL,NULL,NULL),(47,27,'A document listing the time it takes to execute the existing manual processes',0,NULL,NULL,NULL,NULL),(48,27,'A document detailing software requirements and specifications',1,NULL,NULL,NULL,NULL),(49,27,'A document which features instructions for how to install new software and test it for errors',0,NULL,NULL,NULL,NULL),(50,27,'A document used while testing the software code for validity',0,NULL,NULL,NULL,NULL),(51,28,'The cost-benefit analysis',0,NULL,NULL,NULL,NULL),(52,28,'The business case',0,NULL,NULL,NULL,NULL),(53,28,'The stakeholders\' needs and constraints',1,NULL,NULL,NULL,NULL),(54,28,'The requirement management plan',0,NULL,NULL,NULL,NULL),(55,29,'Robustness requirement',0,NULL,NULL,NULL,NULL),(56,29,'integrity requirement',1,NULL,NULL,NULL,NULL),(57,29,'performance requirement',0,NULL,NULL,NULL,NULL),(58,29,'interoperability requirement',0,NULL,NULL,NULL,NULL),(59,30,'National culture',1,NULL,NULL,NULL,NULL),(60,30,'Quality',1,NULL,NULL,NULL,NULL),(61,30,'Terminology',1,NULL,NULL,NULL,NULL),(62,30,'Repository',0,NULL,NULL,NULL,NULL),(63,30,'Interactions',0,NULL,NULL,NULL,NULL),(64,31,'Waterfall model',1,NULL,NULL,NULL,NULL),(66,31,'Agile model',0,NULL,NULL,NULL,NULL),(67,31,'Spiral model',0,NULL,NULL,NULL,NULL),(68,32,'Check boundary values for missing requirements',0,NULL,NULL,NULL,NULL),(69,32,'Trace system requirements, user requirements, event-response lists, and business rules to their corresponding functional requirements to make sure that all the necessary functionality was derived.',0,NULL,NULL,NULL,NULL),(70,32,'Create a checklist of common functional areas to consider for your projects',0,NULL,NULL,NULL,NULL),(71,32,'Check a list of tasks corresponding with end users',1,NULL,NULL,NULL,NULL),(72,33,'It helps in planning the roadmap for the product',0,NULL,NULL,NULL,NULL),(73,33,'It helps in managing the demands of stakeholders',1,NULL,NULL,NULL,NULL),(74,33,'It helps in determining what to prioritize first. Team ranks the item and then builds value.',0,NULL,NULL,NULL,NULL),(75,33,'It helps in re-ranking the features so that more value can be added to the product.',0,NULL,NULL,NULL,NULL),(76,34,'Tracking the status distribution of all requirements',0,NULL,NULL,NULL,NULL),(77,34,'Recording the status of each requirements',0,NULL,NULL,NULL,NULL),(78,34,'Defining possible statuses',0,NULL,NULL,NULL,NULL),(79,34,'Tracking individual requirements versions',1,NULL,NULL,NULL,NULL),(80,35,'Decision tree',1,NULL,NULL,NULL,NULL),(81,35,'Context diagram',0,NULL,NULL,NULL,NULL),(82,35,' Swimlane diagram',0,NULL,NULL,NULL,NULL),(83,36,'Scenarios',0,NULL,NULL,NULL,NULL),(84,36,'User stories',0,NULL,NULL,NULL,NULL),(85,36,'Storyboards',1,NULL,NULL,NULL,NULL),(86,37,' Describes functions software is to execute',1,NULL,NULL,NULL,NULL),(87,37,' Describes functions software is to run',1,NULL,NULL,NULL,NULL),(88,37,' Describes functions software is to do',0,NULL,NULL,NULL,NULL),(89,37,' Describes functions software is to stop',0,NULL,NULL,NULL,NULL),(90,38,'Analysis',0,NULL,NULL,NULL,NULL),(91,38,'Specification',0,NULL,NULL,NULL,NULL),(92,38,'Elicitation',1,NULL,NULL,NULL,NULL),(93,38,'Validation',0,NULL,NULL,NULL,NULL),(94,39,'Requirements committed to be implemented',0,NULL,NULL,NULL,NULL),(95,40,'Requirements committed to be implemented',0,NULL,NULL,NULL,NULL),(96,40,'Requirements committed to be tested',0,NULL,NULL,NULL,NULL),(97,40,'Requirements within scope',1,NULL,NULL,NULL,NULL),(98,40,'Requirements out of scope',0,NULL,NULL,NULL,NULL),(99,39,'Elicitation',1,NULL,NULL,NULL,NULL),(100,39,'Specification',0,NULL,NULL,NULL,NULL),(101,41,'Develop the change planv',0,NULL,NULL,NULL,NULL),(102,41,'Recognize the need for change',0,NULL,NULL,NULL,NULL),(103,41,'Select the change agent',0,NULL,NULL,NULL,NULL),(104,41,'Implement the change',1,NULL,NULL,NULL,NULL),(105,42,'Develop the change planv',0,NULL,NULL,NULL,NULL),(106,42,'Recognize the need for change',0,NULL,NULL,NULL,NULL),(107,42,'Select the change agent',0,NULL,NULL,NULL,NULL),(108,42,'Implement the change',1,NULL,NULL,NULL,NULL),(109,43,' in technology',0,NULL,NULL,NULL,NULL),(110,43,'in customer\'s expectations',0,NULL,NULL,NULL,NULL),(111,43,'All of the mentioned',1,NULL,NULL,NULL,NULL),(112,43,'to the environment',0,NULL,NULL,NULL,NULL),(113,43,'in the demand of stakeholders',0,NULL,NULL,NULL,NULL),(114,44,'Facilitator meetings',0,NULL,NULL,NULL,NULL),(115,44,'Prototypes',1,NULL,NULL,NULL,NULL),(116,44,'Observations',0,NULL,NULL,NULL,NULL),(117,44,'Interviews',0,NULL,NULL,NULL,NULL),(118,45,'Business rules',0,NULL,NULL,NULL,NULL),(119,45,'Security requirements',0,NULL,NULL,NULL,NULL),(120,45,'Constraints',1,NULL,NULL,NULL,NULL),(121,45,' Stakeholder profiles',0,NULL,NULL,NULL,NULL),(122,46,'user requirements',1,NULL,NULL,NULL,NULL),(123,46,'requirements document',0,NULL,NULL,NULL,NULL),(124,47,'Is an approved requirement that has been removed',0,NULL,NULL,NULL,NULL),(125,47,'Is work complete',0,NULL,NULL,NULL,NULL),(126,47,'Has been requested by an authorized source',1,NULL,NULL,NULL,NULL),(127,48,'Function points (Jones 1996b; IFPUG 2010)',0,NULL,NULL,NULL,NULL),(128,48,'All of the mentioned answers',1,NULL,NULL,NULL,NULL),(129,48,'The number, type, and complexity of user interface',0,NULL,NULL,NULL,NULL),(130,48,'The number, type, and complexity of user interface',0,NULL,NULL,NULL,NULL),(131,48,'Estimated lines of code needed to implement specific requirements',0,NULL,NULL,NULL,NULL),(132,49,'Requirements tracing',0,NULL,NULL,NULL,NULL),(133,49,' Impact analysis',0,NULL,NULL,NULL,NULL),(134,49,'System definition',1,NULL,NULL,NULL,NULL),(135,50,'precondition',0,NULL,NULL,NULL,NULL),(136,50,'postcondition',1,NULL,NULL,NULL,NULL),(137,51,'How easy it is for people to learn, remember, and use the system',0,NULL,NULL,NULL,NULL),(138,51,'How easily the system can be made to work in other operating environments',1,NULL,NULL,NULL,NULL),(139,51,'How quickly and predictably the system responds to user inputs or other events',0,NULL,NULL,NULL,NULL),(140,51,'How well the system protects against unauthorized access to the application and its data',0,NULL,NULL,NULL,NULL),(142,55,'Project plan',1,NULL,NULL,NULL,NULL),(143,55,'Business plan',0,NULL,NULL,NULL,NULL),(144,55,'Support plan',0,NULL,NULL,NULL,NULL),(145,55,'None of the above',0,NULL,NULL,NULL,NULL),(146,56,'A dynamic analysis tool',0,NULL,NULL,NULL,NULL),(147,56,' A test execution tool',0,NULL,NULL,NULL,NULL),(148,56,'A debugging tool',0,NULL,NULL,NULL,NULL),(149,56,'A test management tool',1,NULL,NULL,NULL,NULL),(150,57,'Error guessing',1,NULL,NULL,NULL,NULL),(151,57,'Walkthrough',0,NULL,NULL,NULL,NULL),(152,57,'Data flow analysis',0,NULL,NULL,NULL,NULL),(153,57,'Inspections',0,NULL,NULL,NULL,NULL),(154,58,'Test procedure specification',1,NULL,NULL,NULL,NULL),(155,58,'Test design specification',0,NULL,NULL,NULL,NULL),(156,58,'Test case specification',0,NULL,NULL,NULL,NULL),(157,58,' Test plan',0,NULL,NULL,NULL,NULL),(158,59,'Variables not defined in the code',0,NULL,NULL,NULL,NULL),(159,59,'How much of the code has been covered',1,NULL,NULL,NULL,NULL),(160,60,'Operability',0,NULL,NULL,NULL,NULL),(161,60,'Observability',0,NULL,NULL,NULL,NULL),(162,60,'Robustness',1,NULL,NULL,NULL,NULL),(166,62,'Ranked',0,NULL,NULL,NULL,NULL),(167,62,'Redundant',1,NULL,NULL,NULL,NULL),(168,62,'Consistent',1,NULL,NULL,NULL,NULL),(274,89,' permission consequently obediently',0,NULL,NULL,NULL,NULL),(275,89,' rubric but accidentally inaugurate',0,NULL,NULL,NULL,NULL),(276,89,'property whenever yesterday globalize',0,NULL,NULL,NULL,NULL),(277,63,'Is an approved requirement that has been removed',0,NULL,NULL,NULL,NULL),(278,63,'Is work complete',0,NULL,NULL,NULL,NULL),(279,63,'Has been requested by an authorized source',1,NULL,NULL,NULL,NULL),(280,64,'Function points (Jones 1996b; IFPUG 2010)',0,NULL,NULL,NULL,NULL),(281,64,'All of the mentioned answers',1,NULL,NULL,NULL,NULL),(282,64,'The number, type, and complexity of user interface',0,NULL,NULL,NULL,NULL),(283,64,'The number, type, and complexity of user interface',0,NULL,NULL,NULL,NULL),(284,64,'Estimated lines of code needed to implement specific requirements',0,NULL,NULL,NULL,NULL),(285,65,'Requirements tracing',0,NULL,NULL,NULL,NULL),(286,65,' Impact analysis',0,NULL,NULL,NULL,NULL),(287,65,'System definition',1,NULL,NULL,NULL,NULL),(288,67,'precondition',0,NULL,NULL,NULL,NULL),(289,67,'postcondition',1,NULL,NULL,NULL,NULL),(290,68,'How easy it is for people to learn, remember, and use the system',0,NULL,NULL,NULL,NULL),(291,68,'How easily the system can be made to work in other operating environments',1,NULL,NULL,NULL,NULL),(292,68,'How quickly and predictably the system responds to user inputs or other events',0,NULL,NULL,NULL,NULL),(293,68,'How well the system protects against unauthorized access to the application and its data',0,NULL,NULL,NULL,NULL),(294,69,'Project plan',1,NULL,NULL,NULL,NULL),(295,69,'Business plan',0,NULL,NULL,NULL,NULL),(296,69,'Support plan',0,NULL,NULL,NULL,NULL),(297,69,'None of the above',0,NULL,NULL,NULL,NULL),(298,70,'A dynamic analysis tool',0,NULL,NULL,NULL,NULL),(299,70,' A test execution tool',0,NULL,NULL,NULL,NULL),(300,70,'A debugging tool',0,NULL,NULL,NULL,NULL),(301,70,'A test management tool',1,NULL,NULL,NULL,NULL),(302,71,'Error guessing',1,NULL,NULL,NULL,NULL),(303,71,'Walkthrough',0,NULL,NULL,NULL,NULL),(304,71,'Data flow analysis',0,NULL,NULL,NULL,NULL),(305,71,'Inspections',0,NULL,NULL,NULL,NULL),(306,72,'Test procedure specification',1,NULL,NULL,NULL,NULL),(307,72,'Test design specification',0,NULL,NULL,NULL,NULL),(308,72,'Test case specification',0,NULL,NULL,NULL,NULL),(309,72,' Test plan',0,NULL,NULL,NULL,NULL),(310,73,'Variables not defined in the code',0,NULL,NULL,NULL,NULL),(311,73,'How much of the code has been covered',1,NULL,NULL,NULL,NULL),(312,74,'Operability',0,NULL,NULL,NULL,NULL),(313,74,'Observability',0,NULL,NULL,NULL,NULL),(314,74,'Robustness',1,NULL,NULL,NULL,NULL),(315,75,'Ranked',0,NULL,NULL,NULL,NULL),(316,75,'Redundant',1,NULL,NULL,NULL,NULL),(317,75,'Consistent',1,NULL,NULL,NULL,NULL),(318,76,'Is an approved requirement that has been removed',0,NULL,NULL,NULL,NULL),(319,76,'Is work complete',0,NULL,NULL,NULL,NULL),(320,76,'Has been requested by an authorized source',1,NULL,NULL,NULL,NULL),(321,77,'Function points (Jones 1996b; IFPUG 2010)',0,NULL,NULL,NULL,NULL),(322,77,'All of the mentioned answers',1,NULL,NULL,NULL,NULL),(323,77,'The number, type, and complexity of user interface',0,NULL,NULL,NULL,NULL),(324,77,'The number, type, and complexity of user interface',0,NULL,NULL,NULL,NULL),(325,77,'Estimated lines of code needed to implement specific requirements',0,NULL,NULL,NULL,NULL),(326,78,'Requirements tracing',0,NULL,NULL,NULL,NULL),(327,78,' Impact analysis',0,NULL,NULL,NULL,NULL),(328,78,'System definition',1,NULL,NULL,NULL,NULL),(329,79,'precondition',0,NULL,NULL,NULL,NULL),(330,79,'postcondition',1,NULL,NULL,NULL,NULL),(331,80,'How easy it is for people to learn, remember, and use the system',0,NULL,NULL,NULL,NULL),(332,80,'How easily the system can be made to work in other operating environments',1,NULL,NULL,NULL,NULL),(333,80,'How quickly and predictably the system responds to user inputs or other events',0,NULL,NULL,NULL,NULL),(334,80,'How well the system protects against unauthorized access to the application and its data',0,NULL,NULL,NULL,NULL),(335,81,'Project plan',1,NULL,NULL,NULL,NULL),(336,81,'Business plan',0,NULL,NULL,NULL,NULL),(337,81,'Support plan',0,NULL,NULL,NULL,NULL),(338,81,'None of the above',0,NULL,NULL,NULL,NULL),(339,82,'A dynamic analysis tool',0,NULL,NULL,NULL,NULL),(340,82,' A test execution tool',0,NULL,NULL,NULL,NULL),(341,82,'A debugging tool',0,NULL,NULL,NULL,NULL),(342,82,'A test management tool',1,NULL,NULL,NULL,NULL),(343,83,'Error guessing',1,NULL,NULL,NULL,NULL),(344,83,'Walkthrough',0,NULL,NULL,NULL,NULL),(345,83,'Data flow analysis',0,NULL,NULL,NULL,NULL),(346,83,'Inspections',0,NULL,NULL,NULL,NULL),(347,84,'Test procedure specification',1,NULL,NULL,NULL,NULL),(348,84,'Test design specification',0,NULL,NULL,NULL,NULL),(349,84,'Test case specification',0,NULL,NULL,NULL,NULL),(350,84,' Test plan',0,NULL,NULL,NULL,NULL),(351,85,'Variables not defined in the code',0,NULL,NULL,NULL,NULL),(352,85,'How much of the code has been covered',1,NULL,NULL,NULL,NULL),(353,86,'Operability',0,NULL,NULL,NULL,NULL),(354,86,'Observability',0,NULL,NULL,NULL,NULL),(355,86,'Robustness',1,NULL,NULL,NULL,NULL),(356,87,'Ranked',0,NULL,NULL,NULL,NULL),(357,87,'Redundant',1,NULL,NULL,NULL,NULL),(358,87,'Consistent',1,NULL,NULL,NULL,NULL),(359,88,'Is an approved requirement that has been removed',0,NULL,NULL,NULL,NULL),(360,88,'Is work complete',0,NULL,NULL,NULL,NULL),(361,88,'Has been requested by an authorized source',1,NULL,NULL,NULL,NULL),(362,89,'Function points (Jones 1996b; IFPUG 2010)',0,NULL,NULL,NULL,NULL),(363,89,'All of the mentioned answers',1,NULL,NULL,NULL,NULL),(364,89,'The number, type, and complexity of user interface',0,NULL,NULL,NULL,NULL),(365,89,'The number, type, and complexity of user interface',0,NULL,NULL,NULL,NULL),(366,89,'Estimated lines of code needed to implement specific requirements',0,NULL,NULL,NULL,NULL),(367,66,'Is an approved requirement that has been removed',0,NULL,NULL,NULL,NULL),(368,66,'Is work complete',0,NULL,NULL,NULL,NULL),(369,66,'Has been requested by an authorized source',1,NULL,NULL,NULL,NULL),(370,90,'coin but thoroughly sidestep a reliable ',0,NULL,NULL,NULL,NULL),(371,90,'peel giant before safely bitch a scaly rout yang meanwhile',0,NULL,NULL,NULL,NULL),(372,90,'unexpectedly dare a definitive militate history when quizzically digitalize a similar clamor antigen ',0,NULL,NULL,NULL,NULL),(373,91,'expectation however ',0,NULL,NULL,NULL,NULL),(374,91,'sedately multicast a trivial turn ',0,NULL,NULL,NULL,NULL),(375,91,'oat and lovingly mortar a stained stagger coal ',0,NULL,NULL,NULL,NULL),(376,92,'channel whose exactly mend ',0,NULL,NULL,NULL,NULL),(377,92,'a incomparable wet archaeology ',0,NULL,NULL,NULL,NULL),(378,92,'meanwhile mostly hoick a powerless ',0,NULL,NULL,NULL,NULL),(379,93,'aaaassss',1,NULL,NULL,NULL,NULL),(380,93,'rrrrrrr',0,NULL,NULL,NULL,NULL),(381,94,'peel giant before safely bitch a scaly rout yang meanwhile',0,NULL,NULL,NULL,NULL),(382,94,'unexpectedly dare a definitive militate history when quizzically digitalize a similar clamor antigen ',0,NULL,NULL,NULL,NULL),(383,95,'sedately multicast a trivial turn ',0,NULL,NULL,NULL,NULL),(384,95,'oat and lovingly mortar a stained stagger coal ',0,NULL,NULL,NULL,NULL),(385,96,'a incomparable wet archaeology ',0,NULL,NULL,NULL,NULL),(386,96,'meanwhile mostly hoick a powerless ',0,NULL,NULL,NULL,NULL),(387,97,'peel giant before safely bitch a scaly rout yang meanwhile',0,NULL,NULL,NULL,NULL),(388,97,'unexpectedly dare a definitive militate history when quizzically digitalize a similar clamor antigen ',0,NULL,NULL,NULL,NULL),(389,98,'sedately multicast a trivial turn ',0,NULL,NULL,NULL,NULL),(390,98,'oat and lovingly mortar a stained stagger coal ',0,NULL,NULL,NULL,NULL),(391,99,'a incomparable wet archaeology ',0,NULL,NULL,NULL,NULL),(392,99,'meanwhile mostly hoick a powerless ',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int DEFAULT NULL,
  `assignment_name` varchar(100) DEFAULT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  `content` text,
  `due_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `lesson_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `assignment_ibfk_2_idx` (`lesson_id`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,7,'Precision in Practice: Crafting Comprehensive Software Requirements','Ass3.docx','This assignment aims to provide practical experience in software requirement engineering. Trainees will engage in exercises to elicit, analyze, and document software requirements with precision. Tasks:1Elicitation Exercise:Conduct a simulated interview to gather requirements for a hypothetical project. Use various elicitation techniques and document the collected requirements.Analysis Case StudyAnalyze provided requirements, identify conflicts and dependencies, and create a visual representation. Propose any necessary clarifications or refinements.Documentation Exercise:Create a comprehensive Requirement Specification document for a chosen project, adhering to industry standards.Validation Simulation:Participate in a peer review session, providing and receiving constructive feedback on documented requirements.Submission:Submit a document with results and reflections on the peer review session.Evaluation:Trainees will be assessed based on clarity and completeness of documented requirements, ability to identify issues, and engagement in the peer review process.:','2023-11-15 00:00:00',NULL,NULL,NULL,NULL,1,92),(2,7,'From Data to Decisions: A Statistical and Probabilistic Approach','Ass3.docx','This assignment aims to immerse participants in the application of statistical and probabilistic methods to make informed decisions based on data. Through practical exercises, students will gain hands-on experience in analyzing data, interpreting results, and drawing meaningful conclusions.**Tasks:**. **Data Exploration and Descriptive Statistics:** Choose a dataset relevant to your field of interest or use a provided dataset. Perform exploratory data analysis, calculating descriptive statistics such as mean, median, mode, and standard deviation. Visualize key insights using appropriate graphs and charts.2. **Probability in Action:**   Select a real-world scenario or create a fictional one. Apply probability concepts to model and analyze uncertain events within the scenario. Calculate probabilities, explore conditional probability, and interpret the results in the context of decision-making.3. **Hypothesis Testing:**   Formulate a hypothesis related to your dataset or chosen scenario. Conduct hypothesis testing using appropriate statistical tests (e.g., t-test, chi-square). Interpret the results and make conclusions based on the statistical significance of the findings.**Submission Guidelines:**- Submit a report documenting the data exploration, probability analysis, hypothesis testing, and regression analysis tasks.','2023-11-15 00:00:00',NULL,NULL,NULL,NULL,1,89),(3,7,'Dynamic Java: Creating Responsive Web Applications','Ass3.docx','This assignment is designed to provide hands-on experience in developing responsive web applications using Java technologies. Participants will explore the dynamic aspects of Java in the context of web development, focusing on creating applications that adapt to various devices and user interactions.Servlets and JSP Basics:Develop a simple web application using Java Servlets and JavaServer Pages (JSP). Implement basic functionalities such as user input processing and dynamic content generation.Session Management and User Authentication:Enhance the web application by incorporating session management for user tracking. Implement user authentication mechanisms to secure certain sections of the application.Asynchronous Communication:Explore the use of asynchronous communication in Java web applications. Implement features that leverage AJAX or WebSockets to enable real-time updates without refreshing the entire page.Responsive Design with Bootstrap:Integrate the Bootstrap framework into your application to achieve a responsive design. Ensure that the application layout adapts gracefully to different screen sizes and devices.Submission Guidelines:Submit the source code of the developed web application.','2023-11-15 00:00:00',NULL,NULL,NULL,NULL,1,80),(4,7,'Methods Maven: Becoming Proficient in Research Design','Ass3.docx','This assignment is designed to cultivate expertise in research design methodologies. Participants will engage in practical tasks to deepen their understanding of various research methods, experiment with designing studies, and critically evaluate the choices made in the research process.Tasks:Literature Review:Select a research topic within your field of interest. Conduct a comprehensive literature review to identify existing research, methodologies employed, and gaps in current knowledge. Summarize key findings in a structured documentResearch Questions and Hypotheses:Based on your literature review, formulate clear research questions and hypotheses. Ensure that these questions address the gaps identified in the literature and contribute meaningfully to the understanding of the chosen topic.Research Design Proposal:Develop a detailed research design proposal outlining the methodology you would employ to answer your research questions. Specify the research approach (qualitative, quantitative, or mixed methods), data collection methods, sampling strategy, and data analysis techniques.Submission Guidelines:Submit a research design proposal document containing literature review summaries, research questions, hypotheses, and a detailed methodology.','2023-11-15 00:00:00',NULL,NULL,NULL,NULL,1,105),(5,18,'Precision in Practice: Crafting Comprehensive Software Requirements','Ass3.docx','This assignment is designed to cultivate expertise in research design methodologies. Participants will engage in practical tasks to deepen their understanding of various research methods, experiment with designing studies, and critically evaluate the choices made in the research process.Tasks:Literature Review:Select a research topic within your field of interest. Conduct a comprehensive literature review to identify existing research, methodologies employed, and gaps in current knowledge. Summarize key findings in a structured documentResearch Questions and Hypotheses:Based on your literature review, formulate clear research questions and hypotheses. Ensure that these questions address the gaps identified in the literature and contribute meaningfully to the understanding of the chosen topic.Research Design Proposal:Develop a detailed research design proposal outlining the methodology you would employ to answer your research questions. Specify the research approach (qualitative, quantitative, or mixed methods), data collection methods, sampling strategy, and data analysis techniques.Submission Guidelines:Submit a research design proposal document containing literature review summaries, research questions, hypotheses, and a detailed methodology.','2023-11-15 00:00:00',NULL,NULL,NULL,NULL,1,88),(6,18,'Precision in Practice: Crafting Comprehensive Software Requirements','Ass3.docx','This assignment is designed to cultivate expertise in research design methodologies. Participants will engage in practical tasks to deepen their understanding of various research methods, experiment with designing studies, and critically evaluate the choices made in the research process.Tasks:Literature Review:Select a research topic within your field of interest. Conduct a comprehensive literature review to identify existing research, methodologies employed, and gaps in current knowledge. Summarize key findings in a structured documentResearch Questions and Hypotheses:Based on your literature review, formulate clear research questions and hypotheses. Ensure that these questions address the gaps identified in the literature and contribute meaningfully to the understanding of the chosen topic.Research Design Proposal:Develop a detailed research design proposal outlining the methodology you would employ to answer your research questions. Specify the research approach (qualitative, quantitative, or mixed methods), data collection methods, sampling strategy, and data analysis techniques.Submission Guidelines:Submit a research design proposal document containing literature review summaries, research questions, hypotheses, and a detailed methodology.','2023-11-15 00:00:00',NULL,NULL,NULL,NULL,1,77),(7,18,'Precision in Practice: Crafting Comprehensive Software Requirements','Ass3.docx','This assignment is designed to cultivate expertise in research design methodologies. Participants will engage in practical tasks to deepen their understanding of various research methods, experiment with designing studies, and critically evaluate the choices made in the research process.Tasks:Literature Review:Select a research topic within your field of interest. Conduct a comprehensive literature review to identify existing research, methodologies employed, and gaps in current knowledge. Summarize key findings in a structured documentResearch Questions and Hypotheses:Based on your literature review, formulate clear research questions and hypotheses. Ensure that these questions address the gaps identified in the literature and contribute meaningfully to the understanding of the chosen topic.Research Design Proposal:Develop a detailed research design proposal outlining the methodology you would employ to answer your research questions. Specify the research approach (qualitative, quantitative, or mixed methods), data collection methods, sampling strategy, and data analysis techniques.Submission Guidelines:Submit a research design proposal document containing literature review summaries, research questions, hypotheses, and a detailed methodology.','2023-11-15 00:00:00',NULL,NULL,NULL,NULL,1,89);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_list`
--

DROP TABLE IF EXISTS `assignment_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `chapter_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `lesson_id` int DEFAULT NULL,
  `description` text,
  `file_name` varchar(255) DEFAULT NULL,
  `file_content` mediumblob,
  `due_date` datetime DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `chapter_id` (`chapter_id`),
  KEY `class_id` (`class_id`),
  KEY `lesson_id` (`lesson_id`),
  CONSTRAINT `assignment_list_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `assignment_list_ibfk_2` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`),
  CONSTRAINT `assignment_list_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `assignment_list_ibfk_5` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_list`
--

LOCK TABLES `assignment_list` WRITE;
/*!40000 ALTER TABLE `assignment_list` DISABLE KEYS */;
INSERT INTO `assignment_list` VALUES (1,'Precision in Practice: Crafting Comprehensive Software Requirements',7,16,71,NULL,'This assignment aims to provide practical experience in software requirement engineering. Trainees will engage in exercises to elicit, analyze, and document software requirements with precision. Tasks:1Elicitation Exercise:Conduct a simulated interview to gather requirements for a hypothetical project. Use various elicitation techniques and document the collected requirements.Analysis Case StudyAnalyze provided requirements, identify conflicts and dependencies, and create a visual representation. Propose any necessary clarifications or refinements.Documentation Exercise:Create a comprehensive Requirement Specification document for a chosen project, adhering to industry standards.Validation Simulation:Participate in a peer review session, providing and receiving constructive feedback on documented requirements.Submission:Submit a document with results and reflections on the peer review session.Evaluation:Trainees will be assessed based on clarity and completeness of documented requirements, ability to identify issues, and engagement in the peer review process.:','Ass3.docx',NULL,'2025-11-08 17:20:00',1,NULL,NULL,0,'2023-11-15 17:16:33'),(2,'From Data to Decisions: A Statistical and Probabilistic Approach',7,16,72,92,'This assignment aims to immerse participants in the application of statistical and probabilistic methods to make informed decisions based on data. Through practical exercises, students will gain hands-on experience in analyzing data, interpreting results, and drawing meaningful conclusions.**Tasks:**. **Data Exploration and Descriptive Statistics:** Choose a dataset relevant to your field of interest or use a provided dataset. Perform exploratory data analysis, calculating descriptive statistics such as mean, median, mode, and standard deviation. Visualize key insights using appropriate graphs and charts.2. **Probability in Action:**   Select a real-world scenario or create a fictional one. Apply probability concepts to model and analyze uncertain events within the scenario. Calculate probabilities, explore conditional probability, and interpret the results in the context of decision-making.3. **Hypothesis Testing:**   Formulate a hypothesis related to your dataset or chosen scenario. Conduct hypothesis testing using appropriate statistical tests (e.g., t-test, chi-square). Interpret the results and make conclusions based on the statistical significance of the findings.**Submission Guidelines:**- Submit a report documenting the data exploration, probability analysis, hypothesis testing, and regression analysis tasks.','Ass3.docx',NULL,'2023-11-06 06:20:00',1,NULL,NULL,22,'2023-11-07 06:16:23'),(3,'Dynamic Java: Creating Responsive Web Applications',7,17,73,89,'This assignment is designed to provide hands-on experience in developing responsive web applications using Java technologies. Participants will explore the dynamic aspects of Java in the context of web development, focusing on creating applications that adapt to various devices and user interactions.Servlets and JSP Basics:Develop a simple web application using Java Servlets and JavaServer Pages (JSP). Implement basic functionalities such as user input processing and dynamic content generation.Session Management and User Authentication:Enhance the web application by incorporating session management for user tracking. Implement user authentication mechanisms to secure certain sections of the application.Asynchronous Communication:Explore the use of asynchronous communication in Java web applications. Implement features that leverage AJAX or WebSockets to enable real-time updates without refreshing the entire page.Responsive Design with Bootstrap:Integrate the Bootstrap framework into your application to achieve a responsive design. Ensure that the application layout adapts gracefully to different screen sizes and devices.Submission Guidelines:Submit the source code of the developed web application.','Ass3.docx',NULL,'2023-05-06 16:20:00',0,NULL,NULL,22,'2023-11-07 06:03:17'),(4,'Methods Maven: Becoming Proficient in Research Design',7,18,74,80,'This assignment is designed to cultivate expertise in research design methodologies. Participants will engage in practical tasks to deepen their understanding of various research methods, experiment with designing studies, and critically evaluate the choices made in the research process.Tasks:Literature Review:Select a research topic within your field of interest. Conduct a comprehensive literature review to identify existing research, methodologies employed, and gaps in current knowledge. Summarize key findings in a structured documentResearch Questions and Hypotheses:Based on your literature review, formulate clear research questions and hypotheses. Ensure that these questions address the gaps identified in the literature and contribute meaningfully to the understanding of the chosen topic.Research Design Proposal:Develop a detailed research design proposal outlining the methodology you would employ to answer your research questions. Specify the research approach (qualitative, quantitative, or mixed methods), data collection methods, sampling strategy, and data analysis techniques.Submission Guidelines:Submit a research design proposal document containing literature review summaries, research questions, hypotheses, and a detailed methodology.','Ass3.docx',NULL,'2023-10-06 10:20:00',1,NULL,NULL,NULL,NULL),(5,'Dynamic Java: Creating Responsive Web Applications',18,19,71,88,NULL,'Ass3.docx',NULL,'2023-10-01 09:20:00',0,NULL,NULL,NULL,NULL),(6,'Precision in Practice: Crafting Comprehensive Software Requirements',18,20,72,77,NULL,'Ass3.docx',NULL,'2023-09-07 09:20:00',0,NULL,NULL,NULL,NULL),(7,'Precision in Practice: Crafting Comprehensive Software Requirements',18,21,73,89,NULL,'Ass3.docx',NULL,'2023-10-08 07:00:00',0,NULL,NULL,NULL,NULL),(12,'Assignment 4',7,16,74,105,'Easy learning ',NULL,NULL,'2023-11-07 06:03:00',1,22,'2023-11-07 06:04:15',NULL,NULL),(15,'English Testing',8,16,1,NULL,'',NULL,NULL,'2010-11-15 08:56:00',0,0,'2023-11-15 20:56:42',NULL,NULL);
/*!40000 ALTER TABLE `assignment_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Learning and Supports',NULL,'2023-11-04 09:55:27',NULL,NULL),(2,'Complaints',NULL,'2023-11-04 10:12:32',NULL,NULL),(3,'Annocements',NULL,'2023-11-04 10:12:32',NULL,NULL),(4,'Study resources and tips',NULL,'2023-11-04 10:14:23',NULL,NULL),(5,'Off-Topics',NULL,'2023-11-15 15:51:01',NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter` (
  `chapter_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `display_order` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`chapter_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
INSERT INTO `chapter` VALUES (16,'CHAPTER 1 The essential software requirement',7,1,NULL,NULL,NULL,21,'2023-11-07 13:12:23',NULL),(17,'CHAPTER 2 Requirements from the customer’s ',7,1,NULL,NULL,NULL,NULL,NULL,NULL),(18,'CHAPTER 3 Good practices for requirements ',7,1,NULL,NULL,NULL,NULL,NULL,NULL),(19,'CHAPTER 1 Fundamentals of testing',18,1,NULL,NULL,NULL,NULL,NULL,NULL),(20,'CHAPTER 2 Testing through the software  development life cycle',18,1,NULL,NULL,NULL,NULL,NULL,NULL),(21,'CHAPTER 3 Static techniques',18,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `semester_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `class_name` varchar(25) DEFAULT NULL,
  `description` text,
  `trainer_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `semester_id` (`semester_id`),
  KEY `subject_id` (`subject_id`),
  KEY `trainer_id` (`trainer_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`semester_id`) REFERENCES `setting` (`id`),
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `class_ibfk_3` FOREIGN KEY (`trainer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (71,16,7,'SE1730',NULL,23,'2023-06-09','2023-06-09',1,1,'2023-10-16 11:40:01',1,'2023-10-16 21:19:58'),(72,16,18,'SE1730',NULL,23,'2023-06-09','2023-06-09',0,1,'2023-10-16 11:40:37',1,'2023-10-16 18:33:36'),(73,16,7,'SE1742',NULL,26,'2023-06-09','2023-06-09',0,1,'2023-10-16 11:41:14',1,'2023-10-16 18:33:46'),(74,16,18,'SE1742',NULL,26,'2023-06-09','2023-06-09',1,1,'2023-10-16 11:41:48',1,'2023-10-16 14:52:10');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `thread_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `fk_comment_thread` (`thread_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_comment_thread` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (29,'<p>Wow it is good! I will learn it! Thanks </p>',48,25,'2023-11-15 16:01:12',NULL,NULL),(30,'<p>@Phan Thành Nam</p><p>Glad you like it!</p>',48,20,'2023-11-15 16:02:39',20,'2023-11-15 23:04:06'),(31,'<p>@Vu Quynh Chi</p><p>Hehe</p>',48,25,'2023-11-15 16:05:39',NULL,NULL),(32,'<p>@Phan Thành Nam</p><p>Any further opinions or questions? I will be glad to answer your questions</p>',48,20,'2023-11-15 16:08:24',NULL,NULL),(33,'<p>@Vu Quynh Chi</p><p>Yes, I have a question. How do I pick the best Coursera course for me to learn?</p>',48,25,'2023-11-15 16:11:59',NULL,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension`
--

DROP TABLE IF EXISTS `dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimension` (
  `dimension_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`dimension_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `dimension_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension`
--

LOCK TABLES `dimension` WRITE;
/*!40000 ALTER TABLE `dimension` DISABLE KEYS */;
INSERT INTO `dimension` VALUES (7,'Specification Requirement','Requirement Specification',7,1,NULL,NULL,NULL,NULL),(8,'Elicitation Requirement','Requirement Elicitation',7,1,NULL,NULL,NULL,NULL),(9,'Static testing','Static Testing',18,1,NULL,NULL,NULL,NULL),(10,'Dynamic testing','Dynamic Testing',18,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `posted_by` int DEFAULT NULL,
  `post_at` datetime DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `posted_by` (`posted_by`),
  CONSTRAINT `discussion_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `discussion_ibfk_2` FOREIGN KEY (`posted_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion`
--

LOCK TABLES `discussion` WRITE;
/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_quiz`
--

DROP TABLE IF EXISTS `extra_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_quiz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `chapter_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `class_id` (`class_id`),
  KEY `chapter_id` (`chapter_id`),
  CONSTRAINT `extra_quiz_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`),
  CONSTRAINT `extra_quiz_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `extra_quiz_ibfk_3` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_quiz`
--

LOCK TABLES `extra_quiz` WRITE;
/*!40000 ALTER TABLE `extra_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `lesson_id` int DEFAULT NULL,
  `lesson_type` int DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `user_id` (`user_id`),
  KEY `lesson_id` (`lesson_id`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,20,72,2,7.5,1.18),(2,20,75,2,7.5,0.67),(3,20,74,2,5,0.67),(4,20,76,2,NULL,0),(5,20,92,2,10,3.34),(6,23,74,2,5,2),(7,23,72,2,7.5,0),(8,23,104,2,NULL,0),(16,9,92,3,10,10),(17,9,89,3,10,10),(18,9,80,3,5,10),(19,9,105,3,22.5,10),(20,15,92,3,10,10),(21,15,89,3,10,10),(22,15,80,3,5,10),(23,24,92,3,10,10),(24,24,89,3,10,10),(25,24,80,3,5,10),(26,24,105,3,22.5,10),(31,20,72,2,7.5,1.18),(32,20,75,2,7.5,0.67),(33,20,74,2,5,0.67),(34,20,76,2,NULL,0),(35,20,92,2,10,3.34),(36,23,74,2,5,2),(37,23,72,2,7.5,0),(38,23,104,2,NULL,0),(46,9,80,3,5,10),(47,15,80,3,5,NULL),(48,24,80,3,5,NULL),(49,9,89,3,10,10),(50,15,89,3,10,NULL),(51,24,89,3,10,NULL),(52,20,92,3,10,10),(53,9,105,3,22.5,NULL),(54,15,105,3,22.5,NULL),(55,24,105,3,22.5,NULL);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_history`
--

DROP TABLE IF EXISTS `learning_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learning_history` (
  `student_id` int NOT NULL,
  `lesson_id` int DEFAULT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`student_id`,`class_id`),
  KEY `lesson_id` (`lesson_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `learning_history_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`),
  CONSTRAINT `learning_history_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  CONSTRAINT `learning_history_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_history`
--

LOCK TABLES `learning_history` WRITE;
/*!40000 ALTER TABLE `learning_history` DISABLE KEYS */;
INSERT INTO `learning_history` VALUES (23,75,1),(23,117,5);
/*!40000 ALTER TABLE `learning_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `lesson_type` int DEFAULT NULL,
  `video_link` varchar(1000) DEFAULT NULL,
  `file_attached` varchar(1000) DEFAULT NULL,
  `chapter_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `quiz_id` int DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`lesson_id`),
  KEY `lesson_ibfk_1_idx` (`chapter_id`),
  KEY `lesson_ibfk_2_idx` (`subject_id`),
  KEY `lesson_ibfk_3 _idx` (`quiz_id`),
  CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`),
  CONSTRAINT `lesson_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `lesson_ibfk_3 ` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'Introduction to Software Testing',1,'In a comprehensive exploration of software testing, participants delve into the critical processes and methodologies employed to ensure the quality and reliability of software applications. The lesson begins by establishing the fundamental significance of software testing in the larger context of the software development life cycle. As the journey unfolds, attendees encounter various testing strategies, including the nuanced balance between manual and automated testing. The intricacies of regression testing, user acceptance testing (UAT), and the art of crafting effective test cases are thoroughly examined.',1,'https://www.youtube.com/watch?v=K47pr6lPxsA','',16,7,84,NULL,1,'2023-10-15 23:57:54',1,'2023-10-31 10:37:12'),(70,'50 secs for Software Testing',1,'The lesson then navigates through the lifecycle of defects, emphasizing the pivotal stages of identification, reporting, and tracking. Specialized areas such as performance testing and security testing are illuminated, shedding light on the techniques employed to assess system behavior under diverse conditions and fortify defenses against potential vulnerabilities.',3,NULL,'file_3.pdf',21,7,84,NULL,1,'2023-10-20 02:27:59',21,'2023-10-31 10:37:12'),(72,'Introduction to Software Testing (part 2)',1,'Participants are guided through the best practices of test automation, emphasizing maintainability and judicious selection of test cases for automation. Exploratory testing, with its ad-hoc and session-based variants, is explored as a dynamic and flexible approach to uncovering unforeseen issues.',3,NULL,'file_4.pdf',18,9,84,7.5,1,'2023-10-20 02:28:03',21,'2023-10-31 10:43:39'),(74,'Manual vs. Automated Testing Approaches',0,'Integral to the lesson is the collaboration between testing and development teams. Concepts like Test-Driven Development (TDD) and the integration of testing into continuous integration and continuous testing pipelines are elucidated, ensuring participants are equipped to align testing practices with modern development methodologies, such as Agile and DevOps.',1,'https://www.youtube.com/watch?v=u6QfIXgjwGQ','file_5.pdf',20,11,84,5,1,'2023-10-20 02:28:07',0,'2023-10-25 14:54:57'),(75,'The Importance of Regression Testing',1,'The lesson on software requirements is a voyage into the foundational elements that shape the trajectory of software development. It commences with a profound understanding of software requirements, emphasizing their pivotal role in steering the entire development process.',2,NULL,'',16,12,84,7.5,1,'2023-10-20 02:28:08',0,'2023-10-25 14:55:07'),(76,'Mastering User Acceptance Testing (UAT)',1,'Moving forward, the lesson encompasses the nuanced processes of requirements analysis and specification, incorporating methods such as requirement modeling and prioritization. The importance of requirements validation, through reviews, inspections, and prototyping, is underscored to ensure clarity, completeness, and consistency.',2,NULL,'',17,13,84,NULL,1,'2023-10-20 02:28:11',1,'2023-10-20 02:28:11'),(77,'The Art of Test Case Design',1,'Change management in the realm of requirements is addressed, including strategies for handling changes effectively and conducting impact analyses. Participants gain insights into the concept of traceability, utilizing tools like the Requirements Traceability Matrix (RTM) to link requirements across different phases of the project.',2,NULL,'',18,7,91,NULL,1,'2023-10-20 02:28:14',1,'2023-10-20 02:28:14'),(79,'Understanding the Defect Life Cycle',0,'In the broader context of communication and collaboration, the lesson highlights the imperative of clear communication to all stakeholders and underscores the symbiotic relationship between requirements specialists and development teams. Throughout, the incorporation of tools for requirements management adds a practical dimension to the theoretical foundations laid during the lesson.',2,NULL,'',20,16,91,5,1,'2023-10-20 02:28:17',48,'2023-10-20 03:59:29'),(80,' Exploring Performance and Stress Testing',1,'An overview of software testing concepts.',1,'https://www.youtube.com/watch?v=JEZNzZOY0zA','testing_intro.pdf',16,7,91,5,1,'2023-10-20 02:28:22',1,'2023-10-20 02:28:22'),(87,'A Deep Dive into Software Security Testing',0,'he lesson delves into the art of test case design, exploring techniques such as Equivalence Partitioning to ensure comprehensive coverage. Boundary Value Analysis is highlighted for its efficacy in identifying potential issues at the edges of input domains. Decision Table Testing is discussed to systematically cover all possible combinations of conditions.',2,NULL,'',20,16,91,7.5,1,'2023-10-20 02:44:39',1,'2023-10-20 02:44:39'),(88,'Best Practices in Test Automation',1,'Understanding the life cycle of defects is pivotal. From identification to reporting and tracking, participants gain insights into the meticulous process of managing and resolving issues within the software.',1,'https://www.youtube.com/watch?v=Nzeo6NJwoNk','file_1.pdf',16,7,84,25,1,'2023-10-20 02:46:38',1,'2023-10-20 02:46:38'),(89,'The Power of Exploratory Testing',0,'Participants learn the best practices of test automation, including the importance of maintaining automated tests for long-term efficiency. The lesson emphasizes the strategic selection of test cases for automation to maximize the benefits of automated testing.',1,'https://www.youtube.com/watch?v=goaZTAzsLMk','file_15.pdf',16,18,125,10,1,'2023-10-20 02:46:55',1,'2023-10-20 02:46:55'),(91,'Testing and Development Teams Unite',1,'In navigating testing strategies, participants explore the delicate balance between manual and automated testing. The lesson expounds on the significance of regression testing, ensuring that new code changes do not introduce unintended consequences. The concept of User Acceptance Testing (UAT) is introduced, emphasizing the involvement of end-users in validating software against their expectations.',1,'https://www.youtube.com/watch?v=T3q6QcCQZQg','file_5.pdf',20,11,125,NULL,1,'2023-10-20 02:47:19',1,'2023-10-20 02:47:19'),(92,'Adapting to Iterative Development',1,'Exploratory testing, characterized by its dynamic and unscripted nature, is unfolded. Ad-hoc testing and session-based testing are explored as powerful tools for uncovering unforeseen issues and gaining insights into the software\'s behavior.',2,NULL,'file_6.pdf',16,18,125,10,1,'2023-10-20 02:47:21',1,'2023-10-20 02:47:21'),(93,'Modernizing Testing Practices',0,'Integral to the lesson is the collaborative relationship between testing and development teams. Concepts like Test-Driven Development (TDD) are introduced, emphasizing the seamless integration of testing into the development process. The lesson also explores Continuous Integration and Continuous Testing, ensuring that testing is an intrinsic part of the continuous delivery pipeline.',2,NULL,'file_7.pdf',17,13,125,NULL,1,'2023-10-20 02:47:23',0,'2023-10-20 07:53:42'),(94,'AI and Machine Learning in Software Testing',1,'The lesson concludes by exploring emerging trends in software testing. Concepts like continuous integration, shift-left testing, and the integration of AI and machine learning in testing are discussed, providing participants with a forward-looking perspective on the evolving landscape of software testing.',2,NULL,'file_8.pdf',18,14,125,NULL,1,'2023-10-20 02:47:25',1,'2023-10-20 02:47:25'),(95,'Managing Requirements Changes Effectively',1,'Participants delve into the critical phases of test planning and execution. The lesson covers the importance of meticulous planning, including defining test objectives, scope, resources, and schedules. The intricacies of test execution, involving the systematic running of test cases and the collection of relevant data, are thoroughly explored.',2,NULL,'file_9.pdf',19,15,125,NULL,1,'2023-10-20 02:47:28',1,'2023-10-20 02:47:28'),(96,'Requirements and User Stories in Agile Development',0,'Understanding the significance of a conducive test environment is crucial. Participants learn how to set up and maintain test environments that mirror the production environment as closely as possible. The lesson also delves into the importance of test data and strategies for creating realistic and diverse datasets to validate various scenarios.',2,NULL,'file_10.pdf',20,16,126,NULL,1,'2023-10-20 02:47:30',1,'2023-10-20 02:47:30'),(98,'Navigating Non-Functional Requirements',0,'An exploration of risk-based testing provides participants with insights into prioritizing testing efforts based on potential risks to the project. Understanding how to identify, assess, and mitigate risks ensures a strategic approach to testing that aligns with project priorities and goals.',1,'https://www.youtube.com/watch?v=Tmh5cRGR0bg&t=18s','effective_requirements.pdf',20,7,127,NULL,1,'2023-10-20 03:12:09',1,'2023-10-20 03:12:09'),(102,'Visual Techniques for Requirements',0,'Usability testing is introduced as a critical component of ensuring a positive user experience. Participants learn how to evaluate the software\'s user interface, navigation, and overall user-friendliness. The lesson highlights the significance of gathering feedback from end-users to enhance the software\'s usability.',1,'https://www.youtube.com/watch?v=PXms5QW4-A4','testing_intro.pdf',16,7,128,NULL,1,'2023-10-20 03:12:20',1,'2023-10-20 03:12:20'),(104,'Software Requirements Lesson 4',1,'Given the diversity of devices and browsers, participants explore the challenges and strategies associated with testing on various platforms. Mobile testing and cross-browser testing are discussed, emphasizing the need for comprehensive coverage to ensure a consistent user experience across different environments.',1,'https://www.youtube.com/watch?v=YaXJeUkBe4Y&t=200s','file_15.pdf',16,10,129,NULL,1,'2023-10-20 03:12:26',1,'2023-10-20 03:12:26'),(105,'Collaborative Techniques in Requirements Engineering',1,'The lesson explores the integration of collaboration tools in testing processes. Participants learn about tools for test case management, defect tracking, and communication within testing teams. The effective use of collaborative platforms enhances efficiency and communication throughout the testing life cycle.',1,'https://www.youtube.com/watch?v=cDQ34z0oqnQ','file_1.pdf',16,18,130,22.5,1,'2023-10-20 03:12:29',1,'2023-10-20 03:12:29'),(106,'Requirements Management in the Digital Age',1,'Understanding key metrics in testing and how to generate meaningful reports is a crucial aspect of the lesson. Participants gain insights into metrics such as defect density, test coverage, and pass/fail rates. The ability to interpret and communicate these metrics aids in making informed decisions about the software\'s quality.',2,NULL,'file_10.pdf',20,16,131,NULL,1,'2023-10-20 03:12:31',1,'2023-10-20 03:12:31'),(107,'Requirements in Regulatory Environments',1,'The lesson concludes by emphasizing the importance of a culture of continuous learning and improvement in the field of software testing. Participants are encouraged to stay abreast of industry trends, adopt new methodologies, and contribute to the evolution of testing practices within their organizations.',2,NULL,'file_9.pdf',19,15,132,NULL,1,'2023-10-20 03:12:32',1,'2023-10-20 03:12:32'),(113,'Case Studies in Requirements Engineering',0,'Participants explore the processes of requirements verification and validation, distinguishing between the two critical activities. Verification involves ensuring that the requirements are well-formed, complete, and internally consistent, while validation focuses on confirming that the requirements align with the needs and expectations of stakeholders.',1,'https://www.youtube.com/watch?v=uydAyjqTSiw',NULL,16,7,133,NULL,0,'2023-10-25 15:09:16',NULL,NULL),(114,'The Dynamic Nature of Requirements',1,'In the realm of requirements, the lesson introduces the valuable practices of prototyping and creating mock-ups. Participants learn how these visual representations help in refining and validating requirements with stakeholders, providing a tangible and interactive way to The concept of traceability is delved into more deeply. Participants learn how to create and manage a Requirements Traceability Matrix (RTM) to establish links between requirements and other artifacts throughout the software development lifecycle. Impact analysis techniques are explored to understand the potential effects of changes on the project.',1,'https://www.youtube.com/watch?v=_DsWCUcTgKA','Requirements.docx',17,7,134,NULL,0,'2023-10-26 02:04:10',NULL,NULL),(117,' Introduction to Software Requirements',1,'A detailed exploration of tools for requirements management is provided, offering participants practical insights into selecting and utilizing tools that streamline the requirements process. This includes tools for requirements elicitation, documentation, version control, and collaboration.',2,'','',17,7,135,NULL,0,'2023-10-27 09:29:18',NULL,NULL),(121,' Planning and Execution Essentials',1,'For projects operating in regulatory environments, the lesson addresses the unique challenges and considerations associated with compliance. Participants learn how to navigate regulatory requirements, documentation standards, and the importance of maintaining a rigorous and auditable requirements trail.',2,'','',16,8,140,NULL,0,'2023-10-27 15:42:39',NULL,NULL),(125,' Prioritizing Testing Efforts',0,'The lesson incorporates real-world case studies and examples, allowing participants to glean insights from practical scenarios where effective requirements management led to project success or challenges stemming from inadequate requirements definition.',1,'https://www.youtube.com/watch?v=kwezVUyuvXw&t=1s','hellow.docx',17,11,140,NULL,0,'2023-10-27 16:22:44',0,'2023-10-28 22:44:48'),(126,'Mobile and Cross-Browser Testing Challenges',1,'The lesson concludes by emphasizing that effective requirements engineering is not a one-time activity but a continuous and iterative process. Participants are encouraged to view requirements as a dynamic aspect of software development, subject to change and refinement as the project evolves. The holistic understanding gained equips participants to contribute significantly to the success of software projects through effective requirements engineering.',1,'https://www.youtube.com/watch?v=ewH81DLOunw','',17,11,140,NULL,0,'2023-10-27 16:23:09',NULL,NULL),(127,'Metrics and Reporting in Testing',0,'Building on the earlier discussion, the importance of collaboration and communication in requirements engineering is underscored. Participants learn effective techniques for eliciting requirements through interviews, surveys, and workshops. The lesson also emphasizes the significance of clear and concise documentation to facilitate shared understanding among stakeholders.',3,NULL,'Question1.docx',16,7,141,NULL,21,'2023-10-31 10:21:22',NULL,NULL);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_content` text,
  `dimension_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `explanation` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `chapter_id` int DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `dimension_id` (`dimension_id`),
  KEY `subject_id` (`subject_id`),
  KEY `question_ibfk_3_idx` (`chapter_id`),
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`dimension_id`) REFERENCES `dimension` (`dimension_id`),
  CONSTRAINT `question_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (21,'Which of the following is NOT a good characteristic well written of a software requirements specification? ',7,7,0,' homonym whenever well jail a squiggly edit amount whose mockingly lisp a unique defraud tenet even yieldingly dispense a dental incarnate ottoman instead soon randomise a reasonable fart park however boldly brutalise a loose mission height yet exactly stand a loyal enforce bedrock now tenderly importune a skeletal decrypt',NULL,NULL,20,'2023-10-18 20:13:59',16),(22,'Which is NOT the most important characteristics of product backlog?',8,7,1,'Scientists\' greatest pleasure comes from theories that derive the solution to some deep puzzle from a small set of simple principles in a surprising way. These explanations are called \"beautiful\" or \"elegant.\" Historical examples are Kepler\'s explanation of complex planetary motions as simple ellipses, Bohr\'s explanation of the periodic table of the elements in terms of electron shells, and Watson and Crick\'s double helix.',NULL,NULL,NULL,NULL,16),(23,'A key tool for software designer, developer and their test team is to carry out their respective tasks is defined by:',9,7,1,'crepe though justly jig a earnest conspire crazy once inquisitively abridge a disfigured appease trombone but rarely doze a gummy aggravate joint unless cleverly palliate a insistent kibitz handrail supposing acidly hector a minty illuminate net for sadly boggle a writhing slug blowhole if coaxingly bust a left link perception wherever fiercely rejigger a grizzled sand violin so wearily prevent a essential gang overcoat furthermore roughly muse a triangular ossify loquat when',NULL,NULL,NULL,NULL,16),(24,'What is a best practice for change control?',10,7,1,'cheer incidentally kindheartedly disorientate a short-term wowee pitch but elegantly relieve a sharp descend lollipop until rarely climax a husky gird metric since suddenly shape a rural scamper earthquake however only vacuum a worried roughhouse ',NULL,NULL,NULL,NULL,16),(25,'Which is(are) the skills of business analyst on Agile project?',7,7,1,' valentine who upright reanimate a silky underrate fabric than selfishly blur a tangible avenge checkroom now lively commend a fragrant fritter stage whether knavishly roof a optimistic yelp treatment as equally toll a illegal swoon loggia whether unbearably posset a unwritten winkle stem finally youthfully undercut a miniature encumber communication ',NULL,NULL,NULL,NULL,16),(26,'As requirements are elicited, what source is most likely to impose previously unidentified user processes?',8,7,1,' pigpen indeed instantly mingle a unrealistic untie heritage so softly cinch a rapid warble pepperoni why diligently print a fluffy wedge cappelletti as restfully cook a quiet feather lentil unless lively salt a zesty allude acid wherever',NULL,NULL,NULL,NULL,16),(27,'What is a software requirements specification (SRS) document?',9,7,1,' field that uselessly conscript a scared souse shrine and gleefully like a interesting swing revelation whose usefully plagiarize a jumbo expire equinox if unbearably term a sugary recoup cappuccino though wildly remarry a hasty anger tear how fully bitch a simple mind freon nor often retort a grotesque astonish referendum till anxiously',NULL,NULL,NULL,NULL,16),(28,'Requirement elicitation is communication intensive and should be aligned with:',10,7,1,'jumpsuit after especially factor a dependent wage spoon though quizzically glue a terrific breeze bathrobe finally daintily fuss a possible administer rock till scarcely conciliate a dizzy foul workshop that courageously stick a modern harmonise arrival what fondly frizz a sure-footed natter basket although weakly jol a silky ',NULL,NULL,NULL,NULL,16),(29,'Giving an example of quality requirements: \"After performing a file backup, the system shall verify the backup copy against the original and report any discrepancies\". This is a (an)______',7,7,1,' ornament nor rarely raze a perky toss shortage instead inquisitively kvetch a fumbling blockade village if extremely smoke a young hurry settlement however miserably yelp a frigid gird vinyl after foolishly bleep a husky appall chip though hopelessly hunker a unlined beam morbid whereas perfectly loads a deadly singe clipboard while ',NULL,NULL,NULL,NULL,16),(30,'Which is NOT a reuse success factor?',8,7,1,'cactus wherever uselessly snub a unlucky unearth drain when painfully hem a periodic cut bassinet since anxiously prosecute a melodic reformat purr consequently hastily lowball a heavenly seduce promotion after thankfully ',NULL,NULL,NULL,NULL,16),(31,'If requirements are easily understandable and defined then which software process model is best suited?',8,7,1,' chops but mostly desire a unequaled streamline shore as verbally synchronise a liquid steel CD till utterly assimilate a overjoyed fess egghead whose tensely overwork a blond slope partnership once perfectly marginalise a husky packetise bond likewise majestically prod a internal evangelize derby since reluctantly swaddle a sarcastic nest favorite and urgently sunbathe a enraged jangle instance than queasily renew a powerless geld lawn ',NULL,NULL,NULL,NULL,16),(32,'Which is NOT a technique to find missing requirements?',7,7,1,' operating although vainly crumble a wicked remodel trachoma however wetly bar a idealistic unlearn intelligence as monthly access a nutritious bandage e-book or courageously pike a fragrant chirp t-shirt consequently yieldingly junk a artistic toll chopsticks instead not content a disastrous stutter warden since hastily incriminate ',NULL,NULL,NULL,NULL,16),(33,'Which is NOT the helpful of product backlog?',7,7,1,' dulcimer why merrily steady a creamy redraft pavement lest kookily paralyse a wild emcee decoder what fiercely preregister a weighty build homogenate whenever upbeat reconstruct a emotional share township after knottily whisk a nice stravage candelabra that partially actualise a best sympathise cenotaph incidentally viciously pair a far',NULL,NULL,NULL,NULL,16),(34,'Which activities are NOT belong to requirements status tracking?',9,7,1,' nestmate when tightly enjoy a itchy discolor detour whose unexpectedly incentivise a negative quarterback bet if sympathetically tab a impish queue tile whoever commonly confine a super fume shipper though doubtfully lowball a secret overtrain quill till tightly parboil a dull exterminate moron incidentally briefly reproach a imperfect destabilize mole before mechanically forswear a playful rumor dresser since quietly undulate',NULL,NULL,NULL,NULL,16),(35,'To depict the complex logic, which representation technique should be used?',9,7,1,'faucet than voluntarily mainstream a ruddy raffle instruction provided kissingly mangle a valid paw photodiode while adventurously compliment a classic underplay porch hence generally tinge a awful peel cupboard that uselessly hospitalise a threadbare corner winter incidentally carefully lands a scholarly immure wake than deceivingly range a wicked mesmerise ostrich incidentally unnaturally coax a prime antagonize septicaemia as ',NULL,NULL,NULL,NULL,16),(36,'To express the user task descriptions, which representation technique is NOT suitable?',10,7,1,' die once rudely riddle a wild rule seep since vacantly churn a treasured dragoon regionalism lest obnoxiously fossick a normal wade span what fondly injure a potable pen recess so optimistically adjudge a unwitting repose finding as rapidly splice a acrobatic slow broom until unaccountably stink a deep reward norm once defiantly bodge a frilly sort conifer consequently too notarize a which massage advertisement and',NULL,NULL,NULL,NULL,16),(37,'Which of the following is most true about a non-functional requirement?',8,7,1,'beast before delightfully borrow a pristine value ingredient likewise interestingly grub a bouncy reflect deck however broadly disappoint a right loosen corduroy whereas elegantly enlighten a downright chunter preserves whenever angrily dive a sharp forsake carport since seldom doorstep a warped headbutt morale why deliberately bath a hoarse belie boxer for fortunately toke a primary risk provision whenever daily hesitate',NULL,NULL,NULL,NULL,16),(38,'To understand user tasks and goals and the business objectives with which those tasks align, the Business Analysis should discuss with users at which stage(s):',8,7,1,' parameter hence uselessly immunise a golden superimpose factory what gleefully bound a winding cosy regard which cheerfully polarise a pretty airlift mayor whether too mash a pleased scrap hashtag but bitterly bugger a lovely squabble smock when inquisitively chromakey a limp discriminate flesh why afterwards',NULL,NULL,NULL,NULL,16),(39,'Requirement baselines are:',8,7,1,'notion that tensely debut a alive bay ranger but unbearably overdevelop a grouchy schlep till since majestically overload a rich schmooze wrapper but madly barrack a mild feature ethernet instead daintily insure a enlightened marshal institution yet quaintly immure a parched rosin camp furthermore roughly snuff a relieved ',NULL,NULL,NULL,NULL,16),(40,'Which of these steps in the planned change process puts the change plan into action?',8,7,0,'brother even crossly stigmatise a similar externalize usher finally rapidly practise a infamous pulverise pain or fondly assuage a serpentine preen waterskiing how urgently bird a quirky deliquesce filth furthermore wildly reside a idolized rate yak consequently urgently honeymoon a loathsome panel adobe when shrilly fuss',NULL,NULL,NULL,NULL,16),(41,'Which adverbs are the causes of requirements ambiguity in documenting Software Requirement Specification?',8,7,1,'vshade whether unexpectedly drip a shameless immobilize inlay hence furiously pant a lame collectivise decision provided truly average a monumental entrance linen so tightly overlook a acidic fingerprint overhead after fervently storm a squeaky telecommute commission although limply mould a athletic copyright fiddle ',NULL,NULL,NULL,NULL,16),(42,'Why is Requirements Management important? It is due to the changes',7,7,1,' wallaby provided quickly go a other cannulate tunnel since properly behoove a bountiful decompose suet however officially stampede a competent ovulate detour whenever upwardly elope a harsh rumour thistle and mockingly ',NULL,NULL,NULL,NULL,17),(43,'Which technique overlaps for use in requirements elicitation and requirements validation?',7,7,1,' harmonize provided boldly outlast a essential mingle undertaker meanwhile ultimately slop a silent cauterize alert supposing tomorrow popularise a beneficial fantasize unblinking unless upbeat stuff a well-documented reconcile incubation even briskly throw a loathsome theorise seizure where anxiously rinse a modest puff',NULL,NULL,NULL,NULL,17),(44,'Which requirements should NOT be reused in the scope of cross an enterprise?',7,7,1,' bookcase that violently sandwich a meager gurgle sign now wisely adjudge a both pool stability whoever worriedly raffle a noted sand movement consequently unnecessarily reorient a damaged subvert marriage whether absentmindedly drug a flowery lowball stepping-stone once jubilantly leverage a loose reorient army incidentally ',NULL,NULL,NULL,NULL,17),(45,' The software requirements specification should NOT be called___',8,7,1,'retina so fondly distinguish a growing sublimate vitro inasmuch yearningly endure a fresh skitter lox what abnormally message a numb fox coalition and politely welcome a ill-fated sublimate handgun but unnaturally',NULL,NULL,NULL,NULL,17),(46,'If a requirements status is proposed then it:',9,7,1,' bondsman although elegantly soak a unsung place pneumonia what promptly dollarize a abandoned back downturn than sharply matriculate a rosy solidify regionalism if reassuringly delegate a flowery snooper suitcase wherever thankfully assume a unlawful chunder alder meanwhile yieldingly determine a clueless dollarise raincoat who really levitate a horrible last sty why reluctantly look a abandoned fess chip indeed smoothly parole',NULL,NULL,NULL,NULL,17),(47,'Due to the iterative nature of the requirements process, change has to be managed through the review and approval process. Which of the following is likely to require the least amount of management?',7,7,1,' track where righteously amaze a unwelcome download micronutrient as generously dunt a sharp gobble experience that happily skitter a usable backtrack soap till thankfully snowplough a nutritious coerce emission incidentally queerly toggle a ill-fated wake editorial whereas softly picturize a stained predecease lollipop which daily sluice a mammoth enjoy cause until cheerfully slew a pleased thunder housewife than',NULL,NULL,NULL,NULL,17),(48,'In order to determine solutions to business problems, the business analyst applies a set of:',8,7,1,'cloudburst as fondly embargo a idolized interject billboard if wonderfully encounter a joyful pooh gator inasmuch always endeavour a knowledgeable synchronise painting since nicely namecheck a squeaky emote pottery however unethically harass a dangerous atomise installation whoever righteously hitchhike a svelte brood philosophy till wisely authorize a delightful absorb archeology whose knottily imbue a standard bellow',NULL,NULL,NULL,NULL,17),(49,'Giving a condition example in specification of withdrawn money use case: \"the ATM has dispensed money and printed a receipt\". This is a(n)______',7,7,1,'familiar now fervently disorient a oily attempt manor whenever verbally park a foolhardy fertilize course finally mockingly dispute a grotesque press implementation what angrily misconceive a back keep overcharge whether unimpressively port a merry silt numeric once utterly pot a nutty whack garter although ',NULL,NULL,NULL,NULL,17),(50,'Portability is an internal quality attribute which could be described:',8,7,1,' elevation when colorfully reconstitute a absolute sparkle choker whose madly anoint a practical silhouette eve whoever deceivingly cage a far-off conserve kick-off until unbearably tarry a fresh nosedive porch although lively epitomize a french revile barrier likewise cruelly document a adored delegate compensation lest knavishly sublimate a nippy contract song yet badly telegraph a kosher inhibit wiring why ',NULL,NULL,NULL,NULL,17),(51,'In the V model, the user requirements are detected by',8,7,1,' solidity supposing boastfully baste a single rick slider although rarely tinge a sore divest comportment which generously note a wide shoot cage finally woefully attach a agreeable torch equivalent while joshingly symptomize',NULL,NULL,NULL,NULL,17),(55,'A tool that supports traceability, recording of incidents or scheduling of tests is',7,18,1,' boy instead loftily emulsify a discrete arraign inhabitant provided perfectly rehome a deserted exhaust intuition since loudly note a embarrassed boomerang app furthermore properly tan a orange cluster building after wisely dob a grave cue minibus yet viciously swan a happy-go-lucky refocus variety when speedily mortar ',NULL,NULL,NULL,NULL,19),(56,'Which of the following is not a static testing technique',7,18,1,' lady unless woefully fine a alarming prefer kitchen after shakily mosh a even plate koala or kiddingly sweeps a shimmering scroll alarm whoever defiantly sue a acidic hiss tourism what victoriously scurry a misguided esteem solidarity finally repeatedly fare a insecure connive headphones although absentmindedly',NULL,NULL,NULL,NULL,19),(57,'Which document specifies the sequence of test executions?',8,18,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',NULL,NULL,NULL,NULL,19),(58,'Inspections can find all the following except',8,18,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',NULL,NULL,NULL,NULL,20),(59,'Which of the following is not a characteristic for Testability?',8,18,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',NULL,NULL,NULL,NULL,20),(60,'Software testing accounts to what percent of software development costs?',8,18,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',NULL,NULL,NULL,NULL,20),(61,'aaaaaaaaaaaa ',7,7,0,' income supposing restfully immobilize a somber bamboozle mercury if never hypothesise a joyous forget gel because queasily strain a oddball angle revitalization until quickly wince a stark doom plum inasmuch commonly rankle a shoddy trammel matrix whoever kindly deprecate a dismal unscrew tractor since vainly incline a sweaty',20,'2023-10-17 03:00:47',20,'2023-10-17 03:04:55',16),(62,'Which of the following is NOT a good characteristic well written of a software requirements specification? ',7,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(63,'Which is NOT the most important characteristics of product backlog?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(64,'A key tool for software designer, developer and their test team is to carry out their respective tasks is defined by:',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(65,'What is a best practice for change control?',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(66,'Which is(are) the skills of business analyst on Agile project?',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(67,'Giving an example of quality requirements: \"After performing a file backup, the system shall verify the backup copy against the original and report any discrepancies\". This is a (an)______',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(68,'Which is NOT a reuse success factor?',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(69,'If requirements are easily understandable and defined then which software process model is best suited?',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(70,'Which is NOT a technique to find missing requirements?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(71,'Which is NOT the helpful of product backlog?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(72,'Which activities are NOT belong to requirements status tracking?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(73,'To depict the complex logic, which representation technique should be used?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:37',NULL,NULL,16),(74,'Which of the following is most true about a non-functional requirement?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:38',NULL,NULL,16),(75,'To understand user tasks and goals and the business objectives with which those tasks align, the Business Analysis should discuss with users at which stage(s):',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:38',NULL,NULL,16),(76,'As requirements are elicited, what source is most likely to impose previously unidentified user processes?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:38',NULL,NULL,16),(77,'What is a software requirements specification (SRS) document?',10,7,1,'v matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:38',NULL,NULL,16),(78,'Requirement elicitation is communication intensive and should be aligned with:',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-24 21:04:38',NULL,NULL,16),(79,'Which of the following is NOT a good characteristic well written of a software requirements specification? ',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:13',NULL,NULL,17),(80,'Which is NOT the most important characteristics of product backlog?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:13',NULL,NULL,17),(81,'A key tool for software designer, developer and their test team is to carry out their respective tasks is defined by:',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:13',NULL,NULL,17),(82,'What is a best practice for change control?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:14',NULL,NULL,17),(83,'Which is(are) the skills of business analyst on Agile project?',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:14',NULL,NULL,17),(84,'Giving an example of quality requirements: \"After performing a file backup, the system shall verify the backup copy against the original and report any discrepancies\". This is a (an)______',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:14',NULL,NULL,17),(85,'Which is NOT a reuse success factor?',10,7,1,'v matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:14',NULL,NULL,17),(86,'If requirements are easily understandable and defined then which software process model is best suited?',10,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:14',NULL,NULL,17),(87,'Which is NOT a technique to find missing requirements?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:14',NULL,NULL,17),(88,'Which is NOT the helpful of product backlog?',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-10-27 09:47:15',NULL,NULL,17),(89,' wind likewise properly scotch a joint internalise cannibal even tremendously worship a political merchandise scooter or offensively barnstorm a upbeat ',9,7,1,' matrix instead courageously assemble a equal whizz sunbonnet when frightfully quarrel a grateful rend brother unless carelessly stint a substantial sniffle tosser even deceivingly foreclose a confused upload tradition whether commonly envision a internal batten mileage for fiercely fluster a incomparable privatize manufacturing though',20,'2023-11-04 12:55:30',NULL,NULL,16),(90,'destruction whenever annually orbit a political recover bandana how suspiciously underexpose a shameful drool siege',NULL,7,1,NULL,20,'2023-11-06 18:55:17',NULL,NULL,16),(91,'spy even especially prescribe a unfit prepone chit-chat unless meaningfully weather a fat retort snail till ',NULL,7,1,NULL,20,'2023-11-06 18:55:17',NULL,NULL,16),(92,'goggles where brightly riot a wordy swan mobster wherever unfortunately reintroduce a bumpy archive ',NULL,7,1,NULL,20,'2023-11-06 18:55:17',NULL,NULL,16),(93,'aaaaaaaa  ',NULL,18,1,'  ',20,'2023-11-06 23:31:45',20,'2023-11-06 23:33:43',19),(94,'destruction whenever annually orbit a political recover bandana how suspiciously underexpose a shameful drool siege',NULL,7,0,'coin but thoroughly sidestep a reliable ',20,'2023-11-06 23:35:31',20,'2023-11-06 23:35:31',16),(95,'spy even especially prescribe a unfit prepone chit-chat unless meaningfully weather a fat retort snail till ',NULL,7,0,'expectation however ',20,'2023-11-06 23:35:31',20,'2023-11-06 23:35:31',16),(96,'goggles where brightly riot a wordy swan mobster wherever unfortunately reintroduce a bumpy archive ',NULL,7,0,'channel whose exactly mend ',20,'2023-11-06 23:35:31',20,'2023-11-06 23:35:31',16),(97,'destruction whenever annually orbit a political recover bandana how suspiciously underexpose a shameful drool siege',NULL,7,0,'coin but thoroughly sidestep a reliable ',20,'2023-11-06 23:36:00',20,'2023-11-06 23:36:00',16),(98,'spy even especially prescribe a unfit prepone chit-chat unless meaningfully weather a fat retort snail till ',NULL,7,0,'expectation however ',20,'2023-11-06 23:36:00',20,'2023-11-06 23:36:00',16),(99,'goggles where brightly riot a wordy swan mobster wherever unfortunately reintroduce a bumpy archive ',NULL,7,0,'channel whose exactly mend ',20,'2023-11-06 23:36:00',20,'2023-11-06 23:36:00',16);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_dimention`
--

DROP TABLE IF EXISTS `question_dimention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_dimention` (
  `question_id` int NOT NULL,
  `dimension_id` int NOT NULL,
  PRIMARY KEY (`question_id`,`dimension_id`),
  KEY `dimension_id` (`dimension_id`),
  CONSTRAINT `question_dimention_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `question_dimention_ibfk_2` FOREIGN KEY (`dimension_id`) REFERENCES `dimension` (`dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_dimention`
--

LOCK TABLES `question_dimention` WRITE;
/*!40000 ALTER TABLE `question_dimention` DISABLE KEYS */;
INSERT INTO `question_dimention` VALUES (93,10);
/*!40000 ALTER TABLE `question_dimention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `quiz_name` varchar(100) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `chapter_id` int DEFAULT NULL,
  `lesson_id` int DEFAULT NULL,
  `dimension_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `total_questions` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `quiz_type` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `subject_id` (`subject_id`),
  KEY `chapter_id` (`chapter_id`),
  KEY `lesson_id` (`lesson_id`),
  KEY `dimension_id` (`dimension_id`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`),
  CONSTRAINT `quiz_ibfk_3` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  CONSTRAINT `quiz_ibfk_4` FOREIGN KEY (`dimension_id`) REFERENCES `dimension` (`dimension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (84,'Progress Test 1',7,16,72,7,1,17,4,0,1,0,'2023-10-16 23:53:04',21,'2023-11-15 21:53:36'),(91,'Mid-Term 2',7,16,74,7,1,15,5,0,0,20,'2023-10-16 23:58:27',20,'2023-11-05 20:21:17'),(125,'Progress Test 2',7,16,75,7,0,15,15,1,1,20,'2023-10-30 20:54:02',NULL,NULL),(126,'Progress Test 1',18,19,76,7,1,3,15,1,1,20,'2023-10-30 20:54:47',20,'2023-11-06 00:29:44'),(127,'Progress Test 2',18,20,77,7,1,3,10,0,1,20,'2023-10-30 20:55:16',20,'2023-11-02 10:20:52'),(128,'Mid-Term 1',7,17,79,7,1,15,20,1,1,20,'2023-10-30 20:55:58',NULL,NULL),(129,'Mid-Term 3',7,17,80,7,1,10,25,0,1,20,'2023-10-30 20:56:57',NULL,NULL),(130,'Progress Test 6',7,16,87,7,0,18,18,0,1,20,'2023-10-30 20:58:32',NULL,NULL),(131,'Final Exam',18,19,88,7,0,3,5,0,1,20,'2023-10-30 20:59:09',20,'2023-11-02 10:21:20'),(132,'Test Chap 2',18,20,89,8,0,3,10,0,1,20,'2023-10-30 20:59:31',NULL,NULL),(133,'Test 3',7,16,98,8,0,14,15,0,1,20,'2023-10-30 20:59:55',20,'2023-11-06 00:29:30'),(134,'Test For Fun',7,16,102,8,0,6,10,1,0,20,'2023-10-30 21:00:17',20,'2023-10-30 21:03:41'),(135,'Test Not Fun',7,17,104,8,0,15,30,0,0,20,'2023-10-30 21:00:39',NULL,NULL),(140,'Final Exam',7,17,105,8,0,20,50,0,1,20,'2023-10-30 21:02:56',NULL,NULL),(141,'Retake Exam',7,16,91,8,0,20,50,0,1,20,'2023-10-30 21:03:23',NULL,NULL),(142,'quiz mas',7,16,92,8,0,3,10,1,0,20,'2023-11-01 11:28:33',20,'2023-11-05 18:29:35');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answer`
--

DROP TABLE IF EXISTS `quiz_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answer` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `result_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `answer_options` int DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `result_id` (`result_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `quiz_answer_ibfk_1` FOREIGN KEY (`result_id`) REFERENCES `quiz_result` (`result_id`),
  CONSTRAINT `quiz_answer_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answer`
--

LOCK TABLES `quiz_answer` WRITE;
/*!40000 ALTER TABLE `quiz_answer` DISABLE KEYS */;
INSERT INTO `quiz_answer` VALUES (131,40,26,45),(132,40,27,48),(133,40,28,51),(136,42,22,26),(137,42,22,25),(138,42,25,41),(139,42,28,54),(140,43,21,24),(141,43,21,22),(142,43,22,26),(149,48,39,99),(258,61,21,21),(259,61,22,28),(260,61,24,35),(261,61,26,46),(262,61,28,54),(263,61,29,56),(264,61,30,60);
/*!40000 ALTER TABLE `quiz_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question`
--

DROP TABLE IF EXISTS `quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question` (
  `quiz_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  KEY `quiz_id` (`quiz_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `quiz_question_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`),
  CONSTRAINT `quiz_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question`
--

LOCK TABLES `quiz_question` WRITE;
/*!40000 ALTER TABLE `quiz_question` DISABLE KEYS */;
INSERT INTO `quiz_question` VALUES (84,26),(84,27),(84,28),(84,29),(84,30),(84,31),(84,32),(84,34),(84,35),(91,21),(91,22),(91,24),(91,26),(91,28),(91,29),(91,30),(91,31),(91,32),(91,34),(91,35),(91,36),(91,37),(91,39),(91,40),(84,40),(84,21),(84,25),(84,33),(84,23),(84,24),(84,36),(125,22),(125,25),(125,28),(125,30),(125,32),(125,36),(125,37),(125,41),(125,63),(125,64),(125,66),(125,67),(125,73),(125,75),(125,77),(128,47),(128,48),(128,49),(128,50),(128,51),(128,79),(128,80),(128,81),(128,82),(128,83),(128,84),(128,85),(128,86),(128,87),(128,88),(129,42),(129,43),(129,44),(129,45),(129,46),(129,47),(129,48),(129,49),(129,50),(129,51),(130,22),(130,26),(130,27),(130,29),(130,32),(130,34),(130,35),(130,36),(130,38),(130,39),(130,63),(130,64),(130,66),(130,67),(130,68),(130,69),(130,72),(130,77),(131,55),(131,56),(131,57),(132,58),(132,59),(132,60),(133,22),(133,23),(133,26),(133,27),(133,28),(133,31),(133,32),(133,33),(133,35),(133,37),(133,62),(133,65),(133,66),(133,74),(134,25),(134,28),(134,29),(134,32),(134,41),(134,62),(135,43),(135,44),(135,45),(135,47),(135,48),(135,49),(135,50),(135,51),(135,79),(135,80),(135,83),(135,85),(135,86),(135,87),(135,88),(140,42),(140,43),(140,44),(140,45),(140,46),(140,47),(140,48),(140,49),(140,50),(140,51),(140,79),(140,80),(140,81),(140,82),(140,83),(140,84),(140,85),(140,86),(140,87),(140,88),(141,24),(141,27),(141,28),(141,29),(141,30),(141,35),(141,39),(141,41),(141,62),(141,63),(141,64),(141,65),(141,66),(141,67),(141,69),(141,70),(141,71),(141,76),(141,77),(141,78),(142,39),(142,63),(142,67),(84,22);
/*!40000 ALTER TABLE `quiz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_result`
--

DROP TABLE IF EXISTS `quiz_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_result` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `quiz_id` int DEFAULT NULL,
  `score` float DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `user_id` (`user_id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_result_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `quiz_result_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_result`
--

LOCK TABLES `quiz_result` WRITE;
/*!40000 ALTER TABLE `quiz_result` DISABLE KEYS */;
INSERT INTO `quiz_result` VALUES (40,20,84,1.18,'2023-11-04 21:59:53'),(42,20,125,0.67,'2023-11-04 22:00:37'),(43,20,91,0.67,'2023-11-04 22:01:03'),(45,20,126,0,'2023-11-04 22:35:10'),(48,20,142,3.34,'2023-11-04 22:39:48'),(61,23,91,2,'2023-11-06 20:06:50'),(67,23,84,0,'2023-11-15 19:29:39'),(68,23,135,0,'2023-11-15 22:09:33');
/*!40000 ALTER TABLE `quiz_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(25) DEFAULT NULL,
  `setting_value` varchar(25) DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `display_order` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'Role','Admin',1,'',1,NULL,NULL,20,'2023-10-17 10:10:24'),(2,'Role','Subject Manager',1,NULL,2,NULL,NULL,NULL,NULL),(3,'Role','Trainer',1,NULL,3,NULL,NULL,NULL,NULL),(4,'Role','Trainee',1,NULL,4,NULL,NULL,NULL,NULL),(8,'Semester','SP21',0,NULL,1,1,'2023-10-13 03:09:20',1,'2023-10-16 15:25:07'),(9,'Semester','SU21',0,NULL,2,1,'2023-10-13 03:09:26',1,'2023-10-13 03:14:28'),(10,'Semester','FALL21',0,NULL,3,1,'2023-10-13 03:09:39',1,'2023-10-13 03:14:35'),(11,'Semester','SP22',0,NULL,4,1,'2023-10-13 03:09:46',1,'2023-10-13 03:14:42'),(12,'Semester','SU22',0,NULL,5,1,'2023-10-13 03:09:55',1,'2023-10-13 03:14:48'),(13,'Semester','FALL22',0,NULL,6,1,'2023-10-13 03:10:05',1,'2023-10-13 03:14:54'),(14,'Semester','SP23',0,NULL,7,1,'2023-10-13 03:10:15',1,'2023-10-13 03:15:04'),(15,'Semester','SU23',0,NULL,8,1,'2023-10-13 03:10:31',1,'2023-10-13 03:15:09'),(16,'Semester','FALL23',1,NULL,9,1,'2023-10-13 03:10:42',NULL,NULL),(17,'Semester','SP24',1,NULL,10,1,'2023-10-13 03:10:53',NULL,NULL),(19,'Permitted Mail Domain','fpt.edu.vn',1,NULL,2,1,'2023-10-13 03:11:56',NULL,NULL),(20,'Permitted Mail Domain','fe.edu.vn',1,NULL,3,1,'2023-10-13 03:12:03',NULL,NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_class`
--

DROP TABLE IF EXISTS `student_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_class` (
  `class_id` int NOT NULL,
  `student_id` int NOT NULL,
  `is_active` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `display_order` int DEFAULT NULL,
  PRIMARY KEY (`class_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_class_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `student_class_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class`
--

LOCK TABLES `student_class` WRITE;
/*!40000 ALTER TABLE `student_class` DISABLE KEYS */;
INSERT INTO `student_class` VALUES (1,5,1,NULL,NULL,NULL,NULL,2),(1,23,1,NULL,NULL,NULL,NULL,1),(5,23,1,NULL,NULL,NULL,NULL,1),(71,9,NULL,NULL,NULL,NULL,NULL,NULL),(71,10,NULL,NULL,NULL,NULL,NULL,NULL),(71,11,NULL,NULL,NULL,NULL,NULL,NULL),(71,12,NULL,NULL,NULL,NULL,NULL,NULL),(71,23,NULL,NULL,NULL,NULL,NULL,NULL),(72,10,NULL,NULL,NULL,NULL,NULL,NULL),(72,14,NULL,NULL,NULL,NULL,NULL,NULL),(72,15,NULL,NULL,NULL,NULL,NULL,NULL),(72,23,NULL,NULL,NULL,NULL,NULL,NULL),(72,24,NULL,NULL,NULL,NULL,NULL,NULL),(73,10,NULL,NULL,NULL,NULL,NULL,NULL),(73,11,NULL,NULL,NULL,NULL,NULL,NULL),(73,12,NULL,NULL,NULL,NULL,NULL,NULL),(73,23,NULL,NULL,NULL,NULL,NULL,NULL),(74,14,NULL,NULL,NULL,NULL,NULL,NULL),(74,15,NULL,NULL,NULL,NULL,NULL,NULL),(74,23,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grade`
--

DROP TABLE IF EXISTS `student_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_grade` (
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `mark_type` varchar(10) NOT NULL,
  `mark` float DEFAULT NULL,
  `insert_by` int DEFAULT NULL,
  `insert_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`student_id`,`class_id`,`mark_type`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `student_grade_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`),
  CONSTRAINT `student_grade_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grade`
--

LOCK TABLES `student_grade` WRITE;
/*!40000 ALTER TABLE `student_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(6) DEFAULT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `description` text,
  `manager_id` int DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `manager_name` varchar(50) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (7,'SWR302','Software Requirement','This course is a model-based introduction to RE, providing the conceptual background and terminology on RE, addressing a variety of techniques for requirements development including Analysis and Requirements Elicitation; Requirements Evaluation; Requirements Specification and Documentation; Requirements Quality Assurance. To implement these frameworks, student will be learnt how to find appropriate customer representatives, elicit requirements from them, and document user requirements, business rules, functional requirements, data requirements, and nonfunctional requirements. The numerous visual models that will be represented to illustrate the requirements from various perspectives to supplement natural-language text. Other contents recommend the most effective requirements approaches for various specific classes of projects: agile projects developing products of any type, enhancement and replacement projects, projects that incorporate packaged solutions, outsourced projects, business process automation projects, business analytics projects, and embedded and other real-time systems.',21,0,'Vu Quynh Chi',NULL,NULL,20,'2023-11-06 23:12:21'),(8,'MAS291','Statistics and Probability','Upon finishing the course, students must acquire: the following knowledge:(The fundamental principles of probability and their applications, The frequently used probability distributions.The basics of descriptive statistics,The inferences of statistics: parameter estimations, hypothesis testing, regressions & correlations.Recognize simple statistical models and applied them to solve engineering problems. Use at least one statistical software (Excel, Maxima) for problem solving.',20,0,NULL,NULL,NULL,NULL,NULL),(9,'PRJ301','Java Web Application Development','By the end of this course Students will be able to:Understand the core technologies of Java web programming:Servlet and JSP,Scope of sharing state (session, application, request,page),JSP Tags, JSTL, Customtags,Filtering,Know how to develop and deploy your own websites using Java,Understand and be able to apply MVC architecture for the web,Basic Web application development applying MVC Design Pattern using Servlet/Filter as Controller',NULL,0,NULL,NULL,NULL,NULL,NULL),(10,'JLR302','Research Method','Requirements for implementation orientation of the subject: The subject synthesizes knowledge and language practice skills, as well as cultural and literary knowledge about Japan... learned from the modules First, apply them to the tasks of the subject, combined with mastering the requirements and practicing skills to prepare for the next step which is writing the Graduation Thesis/or Graduation Project for the final semester. of the field of study.',NULL,0,NULL,NULL,NULL,NULL,NULL),(11,'LTG203','Introduction to linguistics','Requirements for implementation orientation of the subject: The subject belongs to the Knowledge - Language Skills module, provided to students after completing language knowledge and skills, contributing to building the basic knowledge of linguistic theory of the Industry. II. Objectives of the subject: (1) Contribute to consolidating language practice knowledge, helping students understand the nature of language in general and Japanese language through integrating specific examples in language practice and mobilizing knowledge about Vietnamese, English, and Japanese that students already know to varying degrees before. Integrate practical knowledge of this language into the theoretical understanding of the field of study.',NULL,0,NULL,NULL,NULL,NULL,NULL),(12,'JPB301','Japanese business language & business manner','Requirements for implementation orientation of the subject: 1) Orientation for implementing part 1 - Office Japanese and office culture - Consolidate knowledge of language practice and provide high-level Japanese knowledge such as: forms of honorifics, expressions for communicating with customers or working in Japanese businesses - Provides basic knowledge in communication such as: how to talk to Japanese people, how to address people, how to refuse, persuade, handle situations, etc. through specific situations and lessons. sample conversations or videos etc.',NULL,0,NULL,NULL,NULL,NULL,NULL),(13,'JPD336','Intermediate Japanese 2-B2.2','Requirements for implementation orientation of the subject: Students synthesize knowledge and language skills learned in previous subjects from JPD113 ~ JPD326, continue to perfect language practice skills, and prepare for the final exam. have skills equivalent to N2. II. Objectives of the subject: 1. Provides about 600 additional vocabulary (out of a total of 3,500~3,800 vocabulary), with the ability to read and recognize 200 more Chinese characters (out of a total of 1,000 words), 60 more grammar patterns (out of a total of 500 patterns) 2. With a more expanded vocabulary on specific topics, complex sentence patterns mainly used in writing with formal, polite speech, etc., students can read, write, and communicate.',NULL,0,NULL,NULL,NULL,NULL,NULL),(14,'ECO111','Microeconomics','Economics is the study of how the society manages its scarce resources. Economics has been divided into the subcategories of microeconomics and macroeconomics. While macroeconomics studies aggregate issues related to national and international economic activities, this course - microeconomics - focuses on the behavior of individual economic agents. Microeconomics studies how households (or individuals), business (or firms, enterprises) and the government make decisions, given scarcity of resources. It also studies the interactions among those market members and how these interactions have impacts on their economic benefits and the economy. Because most of these activities occur in the markets, this course also focuses on how the markets work.',NULL,0,NULL,NULL,NULL,NULL,NULL),(15,'SCM201','Supply Chain Management','A supply chain is comprised of all the parties involved in fulfilling a customer request. The integrated management of this network is a critical determinant of success in today’s competitive environment. Supply chain management is the systemic, strategic coordination of the traditional business functions within a particular company and across businesses within a supply chain, for the purpose of improving the long-term performance of the individual companies and the supply chain as a whole. The major supply chain processes include planning, sourcing, making or converting, fulfillment, and relationships management. The major dimensions for evaluating the performance of supply chain processes and activities are time, cost, quality and compliance. This course covers the major activities of companies involved in profitably coordinating supply and demand in the marketplace to deliver consumer value.',NULL,0,NULL,NULL,NULL,NULL,NULL),(16,'MAS202','Applied Statistics for Business','The course focuses on data summaries and descriptive statistics; introduction to a statistical computer package; probability: distributions, expectation, variance, covariance, portfolios, central limit theorem; statistical inference of univariance data; Statistical inference for bivariate data: inference for intrinsically linear simple regression models. This course will have a business focus. Teaching method is flexible. Lecturers and tutors can mix between traditional teaching method with project-based learning, problem-based learning and flipped classroom.',NULL,0,NULL,NULL,NULL,NULL,NULL),(17,'FIN201','Monetary Economics and Global Economy','The course is an intermediate-level course in macroeconomics, including topics in international, monetary, and financial economics. The goal of the course is to provide a coherent framework for analyzing macroeconomic events, such as business cycles (recessions and booms) and long-run growth, their impact on financial markets, and to discuss macroeconomic policy. In all parts of the course, theories will be applied to current economic events. Particular emphasis will be placed on the relation between macroeconomic events and financial markets.',NULL,0,NULL,NULL,NULL,NULL,NULL),(18,'SWT301','Software Testing','General concepts about software testing: Testing techniques aimed at assuring that appropriate functionality has been implemented correctly in the software system or product, including:  black box or functional testing,  clear box or structural testing, usage-based statistical testing.These testing techniques are organized by their underlying models, including lists, partitions and equivalent classes, finite-state machines.Test activities, management, and related issues, such as testing sub-phases, team organization, testing process, people\'s roles and responsibilities, test automation, etc., will also be discussed.',21,0,'Vu Quynh Chi',NULL,NULL,NULL,NULL),(19,'cccc','aaaaa','   aaaa  ',NULL,1,NULL,20,'2023-11-06 23:12:35',20,'2023-11-06 23:13:08');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submitted_assignment`
--

DROP TABLE IF EXISTS `submitted_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submitted_assignment` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `student_id` int NOT NULL,
  `mark` float DEFAULT NULL,
  `is_submit` bit(1) DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `assignment_file` text,
  KEY `class_id` (`class_id`),
  KEY `student_id` (`student_id`),
  KEY `submitted_assignment_ibfk_1_idx` (`assignment_id`),
  CONSTRAINT `submitted_assignment_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignment_list` (`id`),
  CONSTRAINT `submitted_assignment_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `submitted_assignment_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submitted_assignment`
--

LOCK TABLES `submitted_assignment` WRITE;
/*!40000 ALTER TABLE `submitted_assignment` DISABLE KEYS */;
INSERT INTO `submitted_assignment` VALUES (1,1,20,10,NULL,NULL,'Ass3.docx'),(2,4,9,10,NULL,NULL,NULL),(3,4,9,10,NULL,NULL,NULL),(4,4,9,NULL,NULL,NULL,NULL),(12,4,9,NULL,NULL,NULL,NULL),(2,4,15,NULL,NULL,NULL,NULL),(3,4,15,NULL,NULL,NULL,NULL),(4,4,15,NULL,NULL,NULL,NULL),(2,4,24,NULL,NULL,NULL,NULL),(3,4,24,NULL,NULL,NULL,NULL),(4,4,24,NULL,NULL,NULL,NULL),(12,4,24,NULL,NULL,NULL,NULL),(1,71,23,5,_binary '','2023-11-15 00:00:00','Ass3.docx'),(2,71,23,6,_binary '','2023-11-16 00:00:00','Ass3.docx'),(3,71,23,4,_binary '','2023-11-17 00:00:00','Ass3.docx'),(1,72,23,6,_binary '','2023-11-18 00:00:00','Ass3.docx'),(2,72,23,7,_binary '','2023-11-15 00:00:00','Ass3.docx'),(3,72,23,8,_binary '','2023-11-15 00:00:00','Ass3.docx'),(1,73,23,9,_binary '','2023-11-15 00:00:00','Ass3.docx'),(2,73,23,4,_binary '','2023-11-15 00:00:00','Ass3.docx'),(3,73,23,5,_binary '','2023-11-15 00:00:00','Ass3.docx'),(1,74,23,6,_binary '','2023-11-15 00:00:00','Ass3.docx'),(2,74,23,7,_binary '','2023-11-15 00:00:00','Ass3.docx'),(3,74,23,8,_binary '','2023-11-15 00:00:00','Ass3.docx'),(1,71,7,9,_binary '','2023-11-15 00:00:00','Ass3.docx'),(2,71,7,4,_binary '','2023-11-15 00:00:00','Ass3.docx'),(3,71,7,3,_binary '','2023-11-15 00:00:00','Ass3.docx'),(1,72,7,5,_binary '','2023-11-15 00:00:00','Ass3.docx'),(2,72,7,3,_binary '','2023-11-15 00:00:00','Ass3.docx'),(3,72,7,2,_binary '','2023-11-15 00:00:00','Ass3.docx'),(1,73,7,1,_binary '','2023-11-15 00:00:00','Ass3.docx'),(2,73,7,4,_binary '','2023-11-15 00:00:00','Ass3.docx'),(3,73,7,5,_binary '','2023-11-15 00:00:00','Ass3.docx');
/*!40000 ALTER TABLE `submitted_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thread` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `topic_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `thread_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (48,'Good study habits for student that you need to know!','<p>Want to develop good study habits? Start small—don’t expect to do everything in this list, at least not right away; pick one or two instead. It’s also important to set realistic and achievable goals for yourself.&nbsp;</p><h2>Good study habits to develop</h2><p>Here are 11 tips to improve your study habits:</p><ol><li>Find a good place to study.</li><li>Minimize distractions.</li><li>Take breaks.</li><li>Space out your studying.</li><li>Set study goals for each session.</li><li>Reward yourself.</li><li>Study with a group.</li><li>Take practice tests.</li><li>Use your own words.</li><li>Ask for help.</li><li>Take care of yourself.</li></ol><p>Let\'s take a closer look at how you can implement each of these habits.</p>',1,20,'2023-11-15 15:59:24',NULL,NULL);
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,1,'Learning',NULL,'2023-11-04 10:21:54',NULL,NULL),(2,1,'Homeworks',NULL,'2023-11-04 10:21:54',NULL,NULL),(3,1,'Questioning',NULL,'2023-11-04 10:21:54',NULL,NULL),(4,1,'Help',NULL,'2023-11-04 12:02:16',NULL,NULL),(5,2,'Reports',NULL,'2023-11-04 12:02:16',NULL,NULL),(6,2,'Complaints',NULL,'2023-11-15 15:55:45',NULL,NULL),(7,3,'Announcement',NULL,'2023-11-15 15:55:45',NULL,NULL),(8,3,'News',NULL,'2023-11-15 15:55:45',NULL,NULL),(9,3,'Updates',NULL,'2023-11-15 15:55:45',NULL,NULL),(10,4,'Tips',NULL,'2023-11-15 15:55:45',NULL,NULL),(11,4,'Resources',NULL,'2023-11-15 15:55:45',NULL,NULL),(12,4,'Deep Study',NULL,'2023-11-15 15:55:45',NULL,NULL),(13,5,'General',NULL,'2023-11-15 15:55:45',NULL,NULL),(14,5,'Debates',NULL,'2023-11-15 15:55:45',NULL,NULL),(15,5,'Conversations',NULL,'2023-11-15 15:55:45',NULL,NULL);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `register_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `setting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Minhdao@0907','minhdao4@fpt.edu.vn','Dao Dao 1','0868391358','avatar1.jpg',0,1,NULL,NULL,1,'2023-11-07 12:08:44'),(5,'John@123','john1@fpt.edu.vn','John Michale','0984333666','avatar1',1,3,1,'2023-10-08 00:27:31',1,'2023-11-07 12:00:03'),(6,'password123','hello@fpt.edu.vn','John DOE2','123-456-0789','avatar.jpg',1,2,1,'2023-10-09 10:46:31',1,'2023-10-09 10:46:31'),(7,'Hello@123','mintdao@fpt.edu.vn','Mint Dao','0268339888','asda',0,3,NULL,NULL,NULL,NULL),(9,'Minhdao@0907','minhdaob@fe.edu.vn','Nguyen Minh Dao B','0123666888','asdasdadsad',1,4,NULL,NULL,NULL,NULL),(10,'Hello@123','daodao@fpt.edu.vn','daodaodao','0868391444','asdsadad',0,4,NULL,NULL,NULL,NULL),(11,'Nam@123','thanhname@fpt.edu.vn','Phan Thanh Nam','0868391666','avatar3.jpg\r\n',1,4,NULL,NULL,NULL,NULL),(12,'Linh@123','khanhlinh@fe.edu.vn','Vu Khanh Linh','0868888888','áddsa',0,4,NULL,NULL,NULL,NULL),(13,'Minhdao@123','linhvu@fpt.edu.vn','Linh Khanh Vu','0868666999','ádasdsad',1,4,NULL,NULL,NULL,NULL),(14,'Linh@123123','nguyenlinh123@fe.edu.vn','Nguyen Vu Linh','0868319359','avatar2',1,4,NULL,NULL,NULL,NULL),(15,'Nam@123','namthanh@fpt.edu.vn','Phan Thanh Nam','0868399999','avatar2',1,4,NULL,NULL,NULL,NULL),(19,'Minhdao@0907','john1@fpt.edu.vn','Nguyen Minh Dao3','0868319359','asdsd',1,2,NULL,NULL,1,'2023-10-13 08:32:31'),(20,'F5FE280471EF82F6C0C19DD6A9B06505','ChiVQHE176029@fpt.edu.vn','Vu Quynh Chi',NULL,'215220231115.png',1,1,NULL,'2023-10-16 18:58:05',NULL,NULL),(21,'185D796BC10307918800B77EEA954B6A','nampthe171690@fpt.edu.vn','Phan Thanh Nam',NULL,'215320231115.png',1,2,NULL,'2023-11-03 20:28:12',NULL,NULL),(22,'60A70BFBE132681D16029F564F760D82','Linhnvhe170399@fpt.edu.vn','Nguyen Vu Linh',NULL,NULL,1,3,NULL,'2023-11-03 20:28:12',NULL,NULL),(23,'BECD7A55B3F6A152B24EE4AF01213551','daonmhe173415@fpt.edu.vn','Nguyen Minh Dao',NULL,'215120231115.png',1,4,NULL,'2023-11-03 20:48:14',NULL,NULL),(24,'48187A8A304A737DCA2DEBC8A0D5D406','hungnthe178033@fpt.edu.vn','Nguyen Tuan Hung',NULL,NULL,1,4,NULL,'2023-11-06 18:49:56',NULL,NULL),(25,NULL,NULL,'Nguyễn Trung Kiên',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL),(26,NULL,NULL,'Nguyễn Thị Hạnh',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL),(27,NULL,NULL,'Phạm Thu Hà',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL),(28,NULL,NULL,'Trần Trọng Dũng',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL),(29,NULL,NULL,'Vũ Đình Tiến',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL),(30,NULL,NULL,'Phan Thị Lộc',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18  3:43:15
