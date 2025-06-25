-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2025 at 08:22 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latest_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `quiz` int(11) NOT NULL,
  `question` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `correct` text NOT NULL,
  `justification` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `quiz`, `question`, `option1`, `option2`, `option3`, `option4`, `correct`, `justification`) VALUES
(1, 1, 'Why is using a mix of characters in passwords important?', 'It makes passwords easier to remember.', 'It makes passwords harder to guess.', 'It looks visually appealing.', 'It shortens the password length.', 'It makes passwords harder to guess.', 'Option 1 is false because using a mix of characters usually makes passwords more complex and harder to remember, not easier.  \nOption 2 is correct, as a combination of uppercase and lowercase letters, numbers, and special characters significantly increases password strength and makes them more difficult to crack.  \nOption 3 is false since the visual appeal of a password has no impact on its security.  \nOption 4 is also false because strong passwords are typically longer, and including a variety of characters does not reduce their length.'),
(2, 1, 'Which of the following should not be included in a password?', 'Special characters.', 'Personal information like your name or birthdate.', 'Uppercase and lowercase letters.', 'Numbers.', 'Personal information like your name or birthdate.', '<br>Option 1 is false because special characters actually enhance password strength.  \n<br>Option 2 is correct, as personal information is easy for attackers to guess or find, which makes the password weak.  \n<br>Option 3 is false since mixing uppercase and lowercase letters adds complexity and improves security.  \n<br>Option 4 is also false because numbers contribute to complexity and help make passwords stronger.'),
(3, 1, 'What should you do if you receive an email asking for personal information?', 'Provide the information immediately.', 'Ignore it and delete the email.', 'Verify the request with the sender through a different communication channel.', 'Forward the email to your friends.', 'Verify the request with the sender through a different communication channel.', '<br>Option 1 is false because you should never share personal information without verifying the authenticity of the request.  \n<br>Option 2 is false as well, since it\'s safer to verify the request first, especially if there\'s a chance it could be a phishing attempt.  \n<br>Option 3 is correct because verifying through another trusted channel helps ensure the request is genuine and not part of a phishing scam.  \n<br>Option 4 is false because forwarding potentially malicious emails increases the risk of spreading the threat to others.\n'),
(4, 1, 'How can you identify a phishing email?', 'It has a suspicious email address.', 'It contains spelling errors.', 'It has an urgent message.', 'All of the above.', 'All of the above.', '<br>Option 1 is partially true because a suspicious sender address is a common indicator of phishing.  \n<br>Option 2 is also partially true, as many phishing emails contain poor grammar or spelling mistakes.  \n<br>Option 3 is partially true since phishing emails often attempt to pressure recipients into taking quick action.  \n<br>Option 4 is correct because phishing emails typically include several red flags, such as suspicious senders, grammatical errors, and a sense of urgency.'),
(5, 1, 'What is Multi-Factor Authentication (MFA)?', 'A single password to access multiple accounts.', 'A method to verify identity using two or more authentication factors.', 'A tool to reset your password.', 'An extra password you create.', 'A method to verify identity using two or more authentication factors.', '<br>Option 1 is false because it describes single sign-on (SSO), not multi-factor authentication (MFA).  \n<br>Option 2 is correct, as MFA uses multiple verification methods—such as something you know, have, or are—to improve security.  \n<br>Option 3 is false since it refers to a password recovery tool, which is not the same as MFA.  \n<br>Option 4 is also false because MFA typically combines a password with another factor like a code or biometric data, not just additional passwords.'),
(6, 1, 'Why is it recommended to use Multi-Factor Authentication (MFA) on your accounts?', 'To reduce the number of passwords you need to remember.', 'To prevent unauthorized access if your password is compromised.', 'To make login faster.', 'To avoid using strong passwords.', 'To prevent unauthorized access if your password is compromised.', '<br>Option 1 is false because MFA adds an additional layer of security but does not reduce the number of passwords required.  \n<br>Option 2 is correct, as even if your password is compromised, MFA can prevent unauthorized access by requiring a second verification factor.  \n<br>Option 3 is false since MFA often introduces an extra step in the login process, which may slightly slow down access.  \n<br>Option 4 is also false because MFA is meant to complement strong passwords, not replace them.'),
(7, 1, 'When browsing the internet, what does it mean if a website begins with u201cHTTPSu201d?', 'Itu2019s a secure website.', 'Itu2019s a high-speed website.', 'Itu2019s free to use.', 'Itu2019s a popular website.', 'Itu2019s a secure website.', '<br>Option 1 is correct because HTTPS encrypts the data transmitted between your browser and the server, enhancing security and protecting sensitive information.  \n<br>Option 2 is false since HTTPS is designed to ensure secure communication, not to guarantee faster website performance.  \n<br>Option 3 is false because HTTPS does not determine whether a website is free or requires payment—it only relates to the security of the connection.  \n<br>Option 4 is also false, as the presence of HTTPS does not indicate a website’s popularity; it simply shows that the site uses encryption to protect data.'),
(8, 1, 'What should you do before clicking on a link in an email?', 'Hover over the link to check the URL.', 'Click immediately to see where it leads.', 'Save it for later use.', 'Ignore it if it looks legitimate.', 'Hover over the link to check the URL.', '<br>Option 1 is correct because hovering over a link helps detect malicious or suspicious URLs before clicking, allowing you to verify its legitimacy.  \n<br>Option 2 is false since clicking a link before checking it can expose you to malware, phishing sites, or other security threats.  \n<br>Option 3 is false because simply delaying doesn\'t make a link safer—it\'s important to verify the link before taking any action.  \n<br>Option 4 is also false as the appearance of a link can be deceptive; always verify the actual destination before clicking.'),
(9, 1, 'Which of these is a safe internet browsing practice?', 'Download files from pop-up ads.', 'Click on ads that look interesting.', 'Share all personal information online.', 'Only download files from trusted sources.', 'Only download files from trusted sources.', '<br>Option 1 is false because pop-ups often contain malicious software or deceptive links that can compromise your security.  \n<br>Option 2 is also false, as online ads may redirect you to untrusted or malicious websites that pose a risk.  \n<br>Option 3 is false since oversharing personal information online can lead to identity theft or social engineering attacks.  \n<br>Option 4 is correct because downloading files from trusted sources reduces the risk of encountering harmful or malicious content.'),
(10, 1, 'Whatu2019s a good reason to regularly update your internet browser?', 'To access the latest features.', 'To improve browsing speed.', 'To protect against new security vulnerabilities.', 'To reduce data usage.', 'To protect against new security vulnerabilities.', '<br>Option 1 is partially true because new features are often added during updates, but security improvements are more critical.  \n<br>Option 2 is false since, although updates may improve speed, that is not their primary purpose.  \n<br>Option 3 is correct because updates patch known security vulnerabilities, helping to protect your system from threats.  \n<br>Option 4 is false because updates do not necessarily reduce data usage.'),
(11, 2, 'What is a good way to secure your mobile device from unauthorized access?', 'Use a simple PIN', 'Donu2019t use any screen lock', 'Use a strong screen lock like a PIN, password, or biometric lock', 'Use a default screen lock', 'Use a strong screen lock like a PIN, password, or biometric lock', '<br>Option 1 is false because simple PINs can be easily guessed or brute-forced.  \n<br>Option 2 is false since having no screen lock allows unrestricted access to anyone who picks up the device.  \n<br>Option 3 is correct because a strong screen lock greatly reduces the risk of unauthorized access.  \n<br>Option 4 is false because default screen locks are often weak and commonly known to attackers.'),
(12, 2, 'Why should you avoid public Wi-Fi without a VPN?', 'Public Wi-Fi is fast', 'Public Wi-Fi is free', 'Public Wi-Fi is usually private', 'Public Wi-Fi can expose your data to risks', 'Public Wi-Fi can expose your data to risks', '<br>Option 1 is false because speed does not guarantee security.  \n<br>Option 2 is false since cost is irrelevant to the risk of data exposure.  \n<br>Option 3 is false because public Wi-Fi is not private and is vulnerable to attacks.  \n<br>Option 4 is correct as, without a VPN, your data can be intercepted by attackers on public networks.\n'),
(13, 2, 'What is an important reason to enable remote wipe on your mobile device?', 'To erase data if the device is lost or stolen', 'To recover deleted data', 'To reset your password', 'To share files more easily', 'To erase data if the device is lost or stolen', '<br>Option 1 is correct because remote wipe protects your sensitive data if your device is compromised.  \n<br>Option 2 is false since remote wipe deletes data and does not recover it.  \n<br>Option 3 is false because password reset is a separate feature and not the purpose of remote wipe.  \n<br>Option 4 is false as remote wipe is designed for security purposes, not for file sharing.\n'),
(14, 2, 'What should you do before leaving sensitive documents unattended?', 'Leave them on your desk', 'Store them in a locked cabinet', 'Hide them under your keyboard', 'Place them in a drawer without a lock', 'Store them in a locked cabinet', '<br>Option 1 is false because leaving sensitive documents on the desk makes them accessible to unauthorized individuals.  \n<br>Option 2 is correct since locked cabinets restrict access and help protect sensitive information.  \n<br>Option 3 is false because hiding documents is neither a secure nor a reliable method of protection.  \n<br>Option 4 is false as unlocked drawers can be easily accessed by others, compromising security.'),
(15, 2, 'What does u201ctailgatingu201d refer to in physical security?', 'Watching over someone\'s shoulder', 'Letting someone follow you into a restricted area without authorization', 'Taking long breaks outside the office', 'Walking slowly behind someone', 'Letting someone follow you into a restricted area without authorization', '<br>Option 1 is false because that’s known as shoulder surfing.  \n<br>Option 2 is correct as tailgating is a physical security breach where unauthorized access is gained by following someone.  \n<br>Option 3 is false since this is not related to security threats.  \n<br>Option 4 is false because walking slowly has no security implications.'),
(16, 2, 'What should you do if you feel pressured to provide sensitive information?', 'Provide the information quickly', 'Ignore the request', 'Slow down and verify the request through official channels', 'Share it over the phone', 'Slow down and verify the request through official channels', '<br>Option 1 is false because rushing can lead to mistakes and the exposure of sensitive data.  \n<br>Option 2 is false since ignoring may not resolve the issue, and verification is crucial.  \n<br>Option 3 is correct as verifying ensures the request is legitimate and helps prevent social engineering attacks.  \n<br>Option 4 is false because the phone is not secure without verifying the caller.'),
(17, 2, 'What is a common tactic attackers use in social engineering?', 'Giving gifts', 'Offering unsolicited help', 'Avoiding direct communication', 'Being unprofessional', 'Offering unsolicited help', '<br>Option 1 is false because although gifts can be used, they are less commonly employed than manipulative tactics.  \n<br>Option 2 is correct as attackers often pose as helpful individuals to gain trust and extract information.  \n<br>Option 3 is false since attackers frequently use direct communication to manipulate the target.  \n<br>Option 4 is false because attackers often appear professional to gain credibility.\n'),
(18, 2, 'Why is it important to limit access to sensitive data to authorized personnel only?', 'To avoid unauthorized disclosure and protect data security', 'To make data easily available to everyone', 'To reduce storage costs', 'To increase data transfer speed', 'To avoid unauthorized disclosure and protect data security', '<br>Option 1 is correct because limiting access reduces the risk of data leaks and helps protect sensitive information.  \n<br>Option 2 is false since making data accessible to everyone increases security risks rather than reducing them.  \n<br>Option 3 is false because access control does not have any effect on storage costs.  \n<br>Option 4 is false as access restrictions do not influence the speed of data transfers.'),
(19, 2, 'How should you dispose of sensitive data?', 'Delete it from your computer', 'Shred physical documents and delete digital files securely', 'Recycle it', 'Place it in a regular trash bin', 'Shred physical documents and delete digital files securely', '<br>Option 1 is false because deleted data can often be recovered unless it is securely wiped.  \n<br>Option 2 is correct since shredding and secure deletion ensure that sensitive data cannot be reconstructed or recovered.  \n<br>Option 3 is false because recycling without proper destruction measures can lead to data exposure and compromise.  \n<br>Option 4 is false as regular trash is not a secure method for disposing of sensitive information.'),
(20, 2, 'Which method is recommended when sharing sensitive data?', 'Regular email', 'Encrypted email or secure file-sharing methods', 'Social media', 'Text message', 'Encrypted email or secure file-sharing methods', '<br>Option 1 is false because regular email can be intercepted easily, putting data at risk.  \n<br>Option 2 is correct since encrypted communication ensures data confidentiality during transmission, protecting it from unauthorized access.  \n<br>Option 3 is false because social media is not a secure channel for sharing sensitive data.  \n<br>Option 4 is false as text messages are not encrypted by default and can be intercepted, compromising sensitive information.'),
(21, 3, 'What should you do before clicking on a link in an email?', 'Click immediately if it looks important', 'Hover over the link to check the destination', 'Open the link in a new browser', 'Ignore all links', 'Hover over the link to check the destination', '<br>Option 1 is false because clicking on links immediately can lead to phishing attacks or malware infections.  \n<br>Option 2 is correct since hovering over a link allows you to see the actual URL and verify its safety before clicking.  \n<br>Option 3 is false as opening a suspicious link in a new browser does not prevent exposure to threats.  \n<br>Option 4 is false because ignoring all links isn’t practical; some links are safe and necessary to access.'),
(22, 3, 'Where should you download software from to reduce the risk of malware?', 'Any free site', 'Official and verified sources only', 'Pop-up advertisements', 'Links in emails', 'Official and verified sources only', '<br>Option 1 is false because free sites may host unsafe or pirated software, putting your system at risk.  \n<br>Option 2 is correct as downloading software from official sites ensures it is genuine and safe to use.  \n<br>Option 3 is false since pop-ups often contain malicious downloads that can compromise your device.  \n<br>Option 4 is false because email links may be phishing or malware traps that trick you into downloading harmful software.'),
(23, 3, 'What is a good practice for backing up important files?', 'Back up files occasionally', 'Back up files regularly to protect data', 'Only back up files once', 'Back up files to your desktop', 'Back up files regularly to protect data', '<br>Option 1 is false because occasional backups risk losing recent data that may not have been captured.  \n<br>Option 2 is correct since regular backups minimize the risk of data loss and ensure data recovery.  \n<br>Option 3 is false because a one-time backup does not ensure ongoing data safety as it won\'t cover new or updated information.  \n<br>Option 4 is false because desktop backups are vulnerable if the device itself is lost, damaged, or compromised.'),
(24, 3, 'How can you identify a suspicious email sender?', 'By only looking at the display name', 'By checking for misspellings or unusual domain names', 'By ignoring the email entirely', 'By responding to the email', 'By checking for misspellings or unusual domain names', '<br>Option 1 is false because display names can be easily spoofed, making them unreliable for identifying legitimate senders.  \n<br>Option 2 is correct since misspellings and unusual domain names are common indicators of phishing attempts.  \n<br>Option 3 is false because while ignoring suspicious emails may be safe, it does not help in verifying the sender’s legitimacy.  \n<br>Option 4 is false because responding to suspicious emails can confirm to attackers that your email is active, potentially increasing the risk of further attacks.'),
(25, 3, 'What should you avoid when connecting to the internet in public spaces?', 'Using a company-approved VPN', 'Using public Wi-Fi without a VPN', 'Using your mobile hotspot', 'Connecting through a secure home network', 'Using public Wi-Fi without a VPN', '<br>Option 1 is false because VPNs protect your data on public networks by encrypting traffic.  \n<br>Option 2 is correct since using public Wi-Fi without a VPN exposes your data to interception by attackers.  \n<br>Option 3 is false because mobile hotspots are generally more secure than public Wi-Fi networks.  \n<br>Option 4 is false as secure home networks provide safety, whereas public spaces are more vulnerable to security risks.'),
(26, 3, 'Why is it important to log out of work systems after youu2019re finished?', 'To avoid using too much bandwidth', 'To save battery', 'To prevent unauthorized access', 'To make your computer faster', 'To prevent unauthorized access', '<br>Option 1 is false because logging out has minimal effect on bandwidth.  \n<br>Option 2 is false as battery saving is not the primary reason for logging out.  \n<br>Option 3 is correct since logging out prevents others from accessing your session or data.  \n<br>Option 4 is false because logging out does not have an impact on system speed.'),
(27, 3, 'What does u201cshadow ITu201d refer to?', 'Using approved software only', 'Using unauthorized software without IT approval', 'Setting up strong passwords', 'Turning off unused applications', 'Using unauthorized software without IT approval', '<br>Option 1 is false because it refers to regular IT policy compliance, not shadow IT.  \n<br>Option 2 is correct as shadow IT involves the use of software or devices without IT oversight.  \n<br>Option 3 is false since setting up passwords is unrelated to the concept of shadow IT.  \n<br>Option 4 is false because turning off apps is not connected to the use of shadow IT.'),
(28, 3, 'Why should you avoid using free or unverified software?', 'Itu2019s difficult to use', 'Itu2019s often illegal', 'It can contain malware or spyware', 'Itu2019s always outdated', 'It can contain malware or spyware', '<br>Option 1 is false because while usability may vary, the primary concern with unverified software is security.  \n<br>Option 2 is false as legality may depend on the software, but the greater issue is the security risk it poses.  \n<br>Option 3 is correct since unverified software can contain hidden malware that may harm your system.  \n<br>Option 4 is false because not all unverified software is outdated; the main concern lies in its trustworthiness.'),
(29, 3, 'What is a secure way to connect to the company network from outside the office?', 'By using any available Wi-Fi network', 'By using the company-approved VPN', 'By using a VPN from any provider', 'By connecting directly without security measures', 'By using the company-approved VPN', '<br>Option 1 is false because public Wi-Fi networks are insecure and can expose data to potential threats.  \n<br>Option 2 is correct as company-approved VPNs provide secure, encrypted connections that align with organizational security policies.  \n<br>Option 3 is false since unapproved VPNs may not comply with company security standards and could introduce vulnerabilities.  \n<br>Option 4 is false because making direct connections without protective measures is risky and can lead to data breaches.'),
(30, 3, 'What can happen if you use unauthorized applications on the network?', 'It can lead to data breaches and compliance violations', 'It can increase system performance', 'It can improve data security', 'It makes applications run faster', 'It can lead to data breaches and compliance violations', '<br>Option 1 is correct because unauthorized apps may introduce vulnerabilities that can lead to security breaches and legal issues.  \n<br>Option 2 is false as unauthorized apps often reduce system performance or cause software conflicts.  \n<br>Option 3 is false because these apps typically increase security risks rather than mitigate them.  \n<br>Option 4 is false since unauthorized apps do not make other applications run faster.'),
(31, 4, 'Why should you avoid plugging in unknown USB drives?', 'They may contain confidential company information', 'They could contain harmful files or malware', 'They are difficult to use', 'They may be too slow to load', 'They could contain harmful files or malware', '<br>Option 1 is false because unknown USB drives may not contain company data, and the real risk lies in potential malware.  \n<br>Option 2 is correct as unknown USB drives can carry malware that can infect and harm your system.  \n<br>Option 3 is false since usability is not the primary security concern in this context.  \n<br>Option 4 is false because speed is irrelevant to the security risks posed by unknown USB drives.'),
(32, 4, 'What should you do with an old USB drive thatu2019s no longer needed?', 'Throw it away', 'Donate it', 'Follow proper disposal procedures', 'Keep it as a backup', 'Follow proper disposal procedures', '<br>Option 1 is false because throwing away a device without wiping it can lead to data leaks.  \n<br>Option 2 is false as donating a device without properly wiping it risks exposing sensitive information.  \n<br>Option 3 is correct since proper disposal involves securely wiping data or physically destroying the device to prevent unauthorized access.  \n<br>Option 4 is false because keeping old drives can result in data exposure if they are lost or stolen.'),
(33, 4, 'Why is it important to be cautious about what you share on social media?', 'To increase engagement', 'To avoid giving away personal or sensitive information that could be misused', 'To keep your profile interesting', 'To follow social media trends', 'To avoid giving away personal or sensitive information that could be misused', '<br>Option 1 is false because increasing engagement on social media is unrelated to maintaining security.  \n<br>Option 2 is correct as oversharing personal information can expose you to identity theft or scams.  \n<br>Option 3 is false since making a profile interesting has no connection to protecting your privacy.  \n<br>Option 4 is false because simply following trends does not ensure online safety.'),
(34, 4, 'How can you protect your privacy on social media?', 'Set your accounts to public', 'Use minimal privacy settings', 'Regularly review and adjust privacy settings', 'Share your posts with everyone', 'Regularly review and adjust privacy settings', '<br>Option 1 is false because public accounts expose your personal information to a wide audience, increasing privacy risks.  \n<br>Option 2 is false as using minimal privacy settings can lead to greater exposure of your data.  \n<br>Option 3 is correct since regularly checking your privacy settings helps ensure your information remains protected.  \n<br>Option 4 is false because sharing information publicly can compromise your privacy.'),
(35, 4, 'What should you do if you notice unusual system behavior, like unexpected pop-ups or unknown login attempts?', 'Try to fix it yourself', 'Ignore it if it doesnu2019t happen again', 'Report it immediately to IT or the security team', 'Restart the system and continue working', 'Report it immediately to IT or the security team', '<br>Option 1 is false because attempting to fix security issues yourself can worsen the problem or overlook potential threats.  \n<br>Option 2 is false as ignoring a potential security breach allows the issue to escalate and cause more damage.  \n<br>Option 3 is correct since reporting the issue to IT ensures that it is properly investigated and addressed promptly.  \n<br>Option 4 is false because simply restarting a system without reporting the issue does not resolve the underlying security problem.'),
(36, 4, 'Why is it important to report security incidents even if they seem minor?', 'Small incidents are usually unimportant', 'Quick reporting can prevent issues from escalating', 'The security team ignores minor issues', 'You can fix them on your own', 'Quick reporting can prevent issues from escalating', '<br>Option 1 is false because even small incidents can indicate larger, underlying security problems.  \n<br>Option 2 is correct as early reporting enables a fast response and effective containment of potential threats.  \n<br>Option 3 is false since security teams depend on incident reports to detect and protect against risks.  \n<br>Option 4 is false because individuals typically do not have the necessary tools or expertise to fully resolve security incidents.'),
(37, 4, 'Which of these is a good practice when working from home?', 'Using personal devices for work tasks', 'Letting family members use your work device', 'Keeping work and personal devices separate', 'Sharing work files on personal accounts', 'Keeping work and personal devices separate', '<br>Option 1 is false because personal devices often lack the security controls enforced on company-approved devices.  \n<br>Option 2 is false as allowing family members to use devices that access company data can lead to unintentional exposure.  \n<br>Option 3 is correct since keeping personal and work devices separate helps reduce the risk of data leaks or malware infections.  \n<br>Option 4 is false because personal accounts may not have the necessary security measures to protect sensitive company information.'),
(38, 4, 'Why should you secure your home Wi-Fi with a strong password?', 'To prevent unauthorized access to your network', 'To make Wi-Fi slower', 'To reduce data usage', 'To allow easy access for everyone', 'To prevent unauthorized access to your network', '<br>Option 1 is correct because a strong password helps prevent unauthorized users from connecting to your Wi-Fi network.  \n<br>Option 2 is false as the strength of a password does not affect Wi-Fi speed or performance.  \n<br>Option 3 is false because data usage is not influenced by how strong your Wi-Fi password is.  \n<br>Option 4 is false since making it easy to access your Wi-Fi increases the risk of security breaches.'),
(39, 4, 'Why is it recommended to lock your screen when stepping away from your work device, even at home?', 'To save battery', 'To protect work data and maintain privacy', 'To allow family members to use it', 'To put the device in sleep mode', 'To protect work data and maintain privacy', '<br>Option 1 is false because locking your screen has minimal impact on battery life.  \n<br>Option 2 is correct as locking your device helps prevent unauthorized access to sensitive data.  \n<br>Option 3 is false since work devices should not be accessed by family members, regardless of intent.  \n<br>Option 4 is false because enabling sleep mode is not the primary reason for locking a device.'),
(40, 4, 'What should you do if you encounter a phishing email while working from home?', 'Delete it and ignore it', 'Report it to the security team', 'Click on the links to see what happens', 'Forward it to friends for awareness', 'Report it to the security team', '<br>Option 1 is false because simply deleting a suspicious message does not alert the security team to a potential threat.  \n<br>Option 2 is correct as reporting the message helps prevent harm and raises awareness among others.  \n<br>Option 3 is false since clicking on suspicious links can expose your system to malware or phishing attacks.  \n<br>Option 4 is false because forwarding a suspicious message can unintentionally spread the threat to others.'),
(41, 5, 'What should you do if you notice suspicious behavior from a coworker?', 'Ignore it unless it becomes serious', 'Report it discreetly to HR or security', 'Confront the coworker directly', 'Report it to the coworkeru2019s manager', 'Report it discreetly to HR or security', '<br>Option 1 is false because ignoring security concerns may allow harmful behavior to continue unchecked.  \n<br>Option 2 is correct as reporting issues discreetly helps protect privacy and ensures they are handled properly.  \n<br>Option 3 is false since directly confronting the issue can escalate tensions or lead to conflict.  \n<br>Option 4 is false because managers may not have the training needed to address security concerns effectively.'),
(42, 5, 'Why is it important to limit access to sensitive data within an organization?', 'To make it easier to find information', 'To reduce the risk of unauthorized access', 'To decrease network load', 'To simplify data backup processes', 'To reduce the risk of unauthorized access', '<br>Option 1 is false because making data easier to find is not the goal of security measures.  \n<br>Option 2 is correct since limiting access helps prevent data breaches and misuse of sensitive information.  \n<br>Option 3 is false as network load concerns are unrelated to access control policies.  \n<br>Option 4 is false because data backup procedures are distinct from access control measures.'),
(43, 5, 'What is one effective way to protect yourself from identity theft?', 'Use simple passwords for all accounts', 'Share personal details only on social media', 'Regularly monitor your financial statements for unauthorized transactions', 'Avoid using multi-factor authentication', 'Regularly monitor your financial statements for unauthorized transactions', '<br>Option 1 is false because simple passwords are insecure and increase the risk of unauthorized access.  \n<br>Option 2 is false as sharing personal details publicly can facilitate identity theft.  \n<br>Option 3 is correct since monitoring accounts helps detect fraud early, allowing for quick response.  \n<br>Option 4 is false because multi-factor authentication provides an important additional layer of security.'),
(44, 5, 'Which of these is a best practice for secure file sharing?', 'Use public Wi-Fi to send files', 'Verify recipients before sending sensitive files', 'Use any file-sharing platform available', 'Send files to multiple recipients for convenience', 'Verify recipients before sending sensitive files', '<br>Option 1 is false because public Wi-Fi networks are insecure and risk data interception.  \n<br>Option 2 is correct as ensuring files are shared only with intended and authorized parties protects sensitive information.  \n<br>Option 3 is false since not all platforms provide adequate security features for safe file sharing.  \n<br>Option 4 is false because unnecessary sharing increases the risk of exposing sensitive data.'),
(45, 5, 'What should you do with sensitive documents when you leave your workspace?', 'Leave them on your desk', 'Store them securely in locked drawers or cabinets', 'Take them home', 'Place them in an open folder', 'Store them securely in locked drawers or cabinets', '<br>Option 1 is false because leaving documents exposed risks unauthorized access to sensitive information.  \n<br>Option 2 is correct since secure storage helps protect sensitive documents from unauthorized viewing.  \n<br>Option 3 is false as taking documents home increases the risk of loss or data breaches.  \n<br>Option 4 is false because open folders do not prevent others from accessing confidential information.'),
(46, 5, 'Why should you log out and lock your screen before stepping away from your computer?', 'To save energy', 'To prevent unauthorized access to your accounts', 'To allow others to use your computer', 'To protect the screen from scratches', 'To prevent unauthorized access to your accounts', '<br>Option 1 is false because energy saving is not the primary reason for locking your device.  \n<br>Option 2 is correct as locking your device prevents others from accessing your work and sensitive information.  \n<br>Option 3 is false since allowing others to access your device compromises security.  \n<br>Option 4 is false because screen protection features are unrelated to device security.'),
(47, 5, 'How can you help prevent insider threats in the workplace?', 'Allow everyone access to all files', 'Grant data access only to those who need it for their roles', 'Share passwords for convenience', 'Use personal devices for work tasks', 'Grant data access only to those who need it for their roles', '<br>Option 1 is false because open access to sensitive information increases the risk of data leaks.  \n<br>Option 2 is correct as role-based access controls help limit exposure to sensitive data based on job responsibilities.  \n<br>Option 3 is false since sharing passwords undermines security measures and increases vulnerability.  \n<br>Option 4 is false because personal devices may not have adequate security safeguards to protect company information.'),
(48, 5, 'What is a secure way to dispose of documents with sensitive information?', 'Place them in the recycling bin', 'Keep them on your desk until further notice', 'Shred them before discarding', 'File them in an unlocked drawer', 'Shred them before discarding', '<br>Option 1 is false because recycling documents without shredding risks data recovery by unauthorized individuals.  \n<br>Option 2 is false as leaving sensitive documents accessible increases the chance of exposure.  \n<br>Option 3 is correct since shredding effectively destroys sensitive information, preventing recovery.  \n<br>Option 4 is false because unlocked drawers do not provide adequate security for confidential documents.'),
(49, 5, 'Which of these should you avoid when sharing sensitive files remotely?', 'Using company-approved, encrypted platforms', 'Encrypting the files before sending', 'Sharing over public Wi-Fi', 'Setting access permissions for recipients', 'Sharing over public Wi-Fi', '<br>Option 1 is false because company-approved platforms are designed to ensure secure communication.  \n<br>Option 2 is false as encrypting data protects it during transmission from unauthorized access.  \n<br>Option 3 is correct since public Wi-Fi networks are insecure and susceptible to interception by malicious actors.  \n<br>Option 4 is false because access permissions regulate who can view or edit files, enhancing security.'),
(50, 5, 'What is a good practice to prevent unauthorized access to printed documents?', 'Print all documents and keep them on your desk', 'Only print necessary documents and retrieve them promptly', 'Leave printed documents unattended in the printer', 'Print all documents for easy access', 'Only print necessary documents and retrieve them promptly', '<br>Option 1 is false because leaving documents on the desk increases the risk of unauthorized exposure.  \n<br>Option 2 is correct since minimizing printing and promptly retrieving documents reduces the chance of sensitive information being accessed by others.  \n<br>Option 3 is false as unattended printed documents are vulnerable to unauthorized access.  \n<br>Option 4 is false because printing unnecessary documents unnecessarily raises the risk of data exposure.');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `user_quiz_score_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option` varchar(255) NOT NULL,
  `is_correct` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`id`, `user_quiz_score_id`, `question_id`, `selected_option`, `is_correct`) VALUES
(41, 16, 1, 'It makes passwords harder to guess.', 1),
(42, 16, 2, 'Personal information like your name or birthdate.', 1),
(43, 16, 3, 'Verify the request with the sender through a different communication channel.', 1),
(44, 16, 4, 'All of the above.', 1),
(45, 16, 5, 'A method to verify identity using two or more authentication factors.', 1),
(46, 16, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(47, 16, 7, 'Itu2019s a secure website.', 1),
(48, 16, 8, 'Hover over the link to check the URL.', 1),
(49, 16, 9, 'Only download files from trusted sources.', 1),
(50, 16, 10, 'To protect against new security vulnerabilities.', 1),
(51, 17, 1, 'It makes passwords harder to guess.', 1),
(52, 17, 2, 'Personal information like your name or birthdate.', 1),
(53, 17, 3, 'Verify the request with the sender through a different communication channel.', 1),
(54, 17, 4, 'It contains spelling errors.', 0),
(55, 17, 5, 'A method to verify identity using two or more authentication factors.', 1),
(56, 17, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(57, 17, 7, 'Itu2019s a secure website.', 1),
(58, 17, 8, 'Click immediately to see where it leads.', 0),
(59, 17, 9, 'Only download files from trusted sources.', 1),
(60, 17, 10, 'To protect against new security vulnerabilities.', 1),
(61, 18, 1, 'It makes passwords harder to guess.', 1),
(62, 18, 2, 'Uppercase and lowercase letters.', 0),
(63, 18, 3, 'Ignore it and delete the email.', 0),
(64, 18, 4, 'It has an urgent message.', 0),
(65, 18, 5, 'An extra password you create.', 0),
(66, 18, 6, 'To make login faster.', 0),
(67, 18, 7, 'Itu2019s a high-speed website.', 0),
(68, 18, 8, 'Click immediately to see where it leads.', 0),
(69, 18, 9, 'Share all personal information online.', 0),
(70, 18, 10, 'To protect against new security vulnerabilities.', 1),
(71, 19, 1, 'It makes passwords harder to guess.', 1),
(72, 19, 2, 'Personal information like your name or birthdate.', 1),
(73, 19, 3, 'Verify the request with the sender through a different communication channel.', 1),
(74, 19, 4, 'All of the above.', 1),
(75, 19, 5, 'A tool to reset your password.', 0),
(76, 19, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(77, 19, 7, 'Itu2019s a high-speed website.', 0),
(78, 19, 8, 'Click immediately to see where it leads.', 0),
(79, 19, 9, 'Share all personal information online.', 0),
(80, 19, 10, 'To reduce data usage.', 0),
(81, 20, 1, 'It makes passwords harder to guess.', 1),
(82, 20, 2, 'Personal information like your name or birthdate.', 1),
(83, 20, 3, 'Verify the request with the sender through a different communication channel.', 1),
(84, 20, 4, 'All of the above.', 1),
(85, 20, 5, 'A tool to reset your password.', 0),
(86, 20, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(87, 20, 7, 'Itu2019s a high-speed website.', 0),
(88, 20, 8, 'Click immediately to see where it leads.', 0),
(89, 20, 9, 'Share all personal information online.', 0),
(90, 20, 10, 'To reduce data usage.', 0),
(91, 21, 1, 'It makes passwords harder to guess.', 1),
(92, 21, 2, 'Personal information like your name or birthdate.', 1),
(93, 21, 3, 'Verify the request with the sender through a different communication channel.', 1),
(94, 21, 4, 'All of the above.', 1),
(95, 21, 5, 'A tool to reset your password.', 0),
(96, 21, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(97, 21, 7, 'Itu2019s a high-speed website.', 0),
(98, 21, 8, 'Click immediately to see where it leads.', 0),
(99, 21, 9, 'Share all personal information online.', 0),
(100, 21, 10, 'To reduce data usage.', 0),
(101, 22, 1, 'It makes passwords harder to guess.', 1),
(102, 22, 2, 'Personal information like your name or birthdate.', 1),
(103, 22, 3, 'Verify the request with the sender through a different communication channel.', 1),
(104, 22, 4, 'All of the above.', 1),
(105, 22, 5, 'A tool to reset your password.', 0),
(106, 22, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(107, 22, 7, 'Itu2019s free to use.', 0),
(108, 22, 8, 'Click immediately to see where it leads.', 0),
(109, 22, 9, 'Share all personal information online.', 0),
(110, 22, 10, 'To access the latest features.', 0),
(111, 23, 1, 'It makes passwords harder to guess.', 1),
(112, 23, 2, 'Personal information like your name or birthdate.', 1),
(113, 23, 3, 'Forward the email to your friends.', 0),
(114, 23, 4, 'It contains spelling errors.', 0),
(115, 23, 5, 'A method to verify identity using two or more authentication factors.', 1),
(116, 23, 6, 'To make login faster.', 0),
(117, 23, 7, 'Itu2019s a popular website.', 0),
(118, 23, 8, 'Save it for later use.', 0),
(119, 23, 9, 'Click on ads that look interesting.', 0),
(120, 23, 10, 'To improve browsing speed.', 0),
(121, 24, 1, 'It makes passwords harder to guess.', 1),
(122, 24, 2, 'Personal information like your name or birthdate.', 1),
(123, 24, 3, 'Verify the request with the sender through a different communication channel.', 1),
(124, 24, 4, 'It has a suspicious email address.', 0),
(125, 24, 5, 'A tool to reset your password.', 0),
(126, 24, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(127, 24, 7, 'Itu2019s free to use.', 0),
(128, 24, 8, 'Ignore it if it looks legitimate.', 0),
(129, 24, 9, 'Click on ads that look interesting.', 0),
(130, 24, 10, 'To improve browsing speed.', 0),
(131, 25, 1, 'It makes passwords harder to guess.', 1),
(132, 25, 2, 'Numbers.', 0),
(133, 25, 3, 'Ignore it and delete the email.', 0),
(134, 25, 4, 'It has an urgent message.', 0),
(135, 25, 5, 'A method to verify identity using two or more authentication factors.', 1),
(136, 25, 6, 'To reduce the number of passwords you need to remember.', 0),
(137, 25, 7, 'Itu2019s a secure website.', 1),
(138, 25, 8, 'Click immediately to see where it leads.', 0),
(139, 25, 9, 'Only download files from trusted sources.', 1),
(140, 25, 10, 'To protect against new security vulnerabilities.', 1),
(141, 26, 1, 'It makes passwords harder to guess.', 1),
(142, 26, 2, 'Uppercase and lowercase letters.', 0),
(143, 26, 3, 'Verify the request with the sender through a different communication channel.', 1),
(144, 26, 4, 'All of the above.', 1),
(145, 26, 5, 'A method to verify identity using two or more authentication factors.', 1),
(146, 26, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(147, 26, 7, 'Itu2019s a high-speed website.', 0),
(148, 26, 8, 'Click immediately to see where it leads.', 0),
(149, 26, 9, 'Only download files from trusted sources.', 1),
(150, 26, 10, 'To protect against new security vulnerabilities.', 1),
(151, 27, 1, 'It makes passwords harder to guess.', 1),
(152, 27, 2, 'Personal information like your name or birthdate.', 1),
(153, 27, 3, 'Verify the request with the sender through a different communication channel.', 1),
(154, 27, 4, 'All of the above.', 1),
(155, 27, 5, 'A method to verify identity using two or more authentication factors.', 1),
(156, 27, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(157, 27, 7, 'Itu2019s a secure website.', 1),
(158, 27, 8, 'Ignore it if it looks legitimate.', 0),
(159, 27, 9, 'Only download files from trusted sources.', 1),
(160, 27, 10, 'To protect against new security vulnerabilities.', 1),
(161, 28, 1, 'It makes passwords harder to guess.', 1),
(162, 28, 2, 'Personal information like your name or birthdate.', 1),
(163, 28, 3, 'Verify the request with the sender through a different communication channel.', 1),
(164, 28, 4, 'All of the above.', 1),
(165, 28, 5, 'A method to verify identity using two or more authentication factors.', 1),
(166, 28, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(167, 28, 7, 'Itu2019s a secure website.', 1),
(168, 28, 8, 'Click immediately to see where it leads.', 0),
(169, 28, 9, 'Click on ads that look interesting.', 0),
(170, 28, 10, 'To protect against new security vulnerabilities.', 1),
(171, 29, 1, 'It makes passwords harder to guess.', 1),
(172, 29, 2, 'Personal information like your name or birthdate.', 1),
(173, 29, 3, 'Verify the request with the sender through a different communication channel.', 1),
(174, 29, 4, 'All of the above.', 1),
(175, 29, 5, 'A method to verify identity using two or more authentication factors.', 1),
(176, 29, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(177, 29, 7, 'Itu2019s a secure website.', 1),
(178, 29, 8, 'Click immediately to see where it leads.', 0),
(179, 29, 9, 'Click on ads that look interesting.', 0),
(180, 29, 10, 'To protect against new security vulnerabilities.', 1),
(181, 30, 1, 'It makes passwords harder to guess.', 1),
(182, 30, 2, 'Personal information like your name or birthdate.', 1),
(183, 30, 3, 'Verify the request with the sender through a different communication channel.', 1),
(184, 30, 4, 'All of the above.', 1),
(185, 30, 5, 'A method to verify identity using two or more authentication factors.', 1),
(186, 30, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(187, 30, 7, 'Itu2019s a secure website.', 1),
(188, 30, 8, 'Click immediately to see where it leads.', 0),
(189, 30, 9, 'Click on ads that look interesting.', 0),
(190, 30, 10, 'To protect against new security vulnerabilities.', 1),
(191, 31, 1, 'It makes passwords harder to guess.', 1),
(192, 31, 2, 'Personal information like your name or birthdate.', 1),
(193, 31, 3, 'Verify the request with the sender through a different communication channel.', 1),
(194, 31, 4, 'All of the above.', 1),
(195, 31, 5, 'A method to verify identity using two or more authentication factors.', 1),
(196, 31, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(197, 31, 7, 'Itu2019s a secure website.', 1),
(198, 31, 8, 'Click immediately to see where it leads.', 0),
(199, 31, 9, 'Click on ads that look interesting.', 0),
(200, 31, 10, 'To protect against new security vulnerabilities.', 1),
(201, 32, 1, 'It makes passwords harder to guess.', 1),
(202, 32, 2, 'Personal information like your name or birthdate.', 1),
(203, 32, 3, 'Verify the request with the sender through a different communication channel.', 1),
(204, 32, 4, 'All of the above.', 1),
(205, 32, 5, 'A method to verify identity using two or more authentication factors.', 1),
(206, 32, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(207, 32, 7, 'Itu2019s a secure website.', 1),
(208, 32, 8, 'Click immediately to see where it leads.', 0),
(209, 32, 9, 'Click on ads that look interesting.', 0),
(210, 32, 10, 'To protect against new security vulnerabilities.', 1),
(211, 33, 1, 'It makes passwords harder to guess.', 1),
(212, 33, 2, 'Personal information like your name or birthdate.', 1),
(213, 33, 3, 'Verify the request with the sender through a different communication channel.', 1),
(214, 33, 4, 'All of the above.', 1),
(215, 33, 5, 'A method to verify identity using two or more authentication factors.', 1),
(216, 33, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(217, 33, 7, 'Itu2019s a secure website.', 1),
(218, 33, 8, 'Click immediately to see where it leads.', 0),
(219, 33, 9, 'Click on ads that look interesting.', 0),
(220, 33, 10, 'To protect against new security vulnerabilities.', 1),
(221, 34, 1, 'It makes passwords harder to guess.', 1),
(222, 34, 2, 'Personal information like your name or birthdate.', 1),
(223, 34, 3, 'Verify the request with the sender through a different communication channel.', 1),
(224, 34, 4, 'All of the above.', 1),
(225, 34, 5, 'A method to verify identity using two or more authentication factors.', 1),
(226, 34, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(227, 34, 7, 'Itu2019s a secure website.', 1),
(228, 34, 8, 'Click immediately to see where it leads.', 0),
(229, 34, 9, 'Click on ads that look interesting.', 0),
(230, 34, 10, 'To protect against new security vulnerabilities.', 1),
(231, 35, 1, 'It makes passwords harder to guess.', 1),
(232, 35, 2, 'Personal information like your name or birthdate.', 1),
(233, 35, 3, 'Verify the request with the sender through a different communication channel.', 1),
(234, 35, 4, 'It has a suspicious email address.', 0),
(235, 35, 5, 'A method to verify identity using two or more authentication factors.', 1),
(236, 35, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(237, 35, 7, 'Itu2019s a secure website.', 1),
(238, 35, 8, 'Hover over the link to check the URL.', 1),
(239, 35, 9, 'Click on ads that look interesting.', 0),
(240, 35, 10, 'To protect against new security vulnerabilities.', 1),
(241, 36, 1, 'It makes passwords harder to guess.', 1),
(242, 36, 2, 'Personal information like your name or birthdate.', 1),
(243, 36, 3, 'Verify the request with the sender through a different communication channel.', 1),
(244, 36, 4, 'It has a suspicious email address.', 0),
(245, 36, 5, 'A method to verify identity using two or more authentication factors.', 1),
(246, 36, 6, 'To prevent unauthorized access if your password is compromised.', 1),
(247, 36, 7, 'Itu2019s a secure website.', 1),
(248, 36, 8, 'Click immediately to see where it leads.', 0),
(249, 36, 9, 'Click on ads that look interesting.', 0),
(250, 36, 10, 'To protect against new security vulnerabilities.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `user_id` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `view` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`user_id`, `email`, `token`, `view`) VALUES
(1, 'shahkathanshah@gmail.com', 'kathanfdshfhfhfnhfcvnfnhcff', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_scores`
--

CREATE TABLE `user_quiz_scores` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `quiz` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `total_score` int(11) DEFAULT NULL,
  `correct_percentage` float DEFAULT NULL,
  `taken_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_quiz_scores`
--

INSERT INTO `user_quiz_scores` (`id`, `username`, `quiz`, `score`, `total_score`, `correct_percentage`, `taken_at`) VALUES
(16, 'kathan', 1, 10, 10, 100, '2025-06-03 05:59:20'),
(17, 'kathan', 1, 8, 10, 80, '2025-06-09 02:22:04'),
(18, 'kathan', 1, 2, 10, 20, '2025-06-25 05:18:13'),
(19, 'kathan', 1, 5, 10, 50, '2025-06-25 05:19:26'),
(20, 'kathan', 1, 5, 10, 50, '2025-06-25 05:19:29'),
(21, 'kathan', 1, 5, 10, 50, '2025-06-25 05:20:06'),
(22, 'kathan', 1, 5, 10, 50, '2025-06-25 05:43:05'),
(23, 'kathan', 1, 3, 10, 30, '2025-06-25 05:43:44'),
(24, 'kathan', 1, 4, 10, 40, '2025-06-25 05:50:28'),
(25, 'kathan', 1, 5, 10, 50, '2025-06-25 05:52:35'),
(26, 'kathan', 1, 7, 10, 70, '2025-06-25 05:54:02'),
(27, 'kathan', 1, 9, 10, 90, '2025-06-25 05:59:11'),
(28, 'kathan', 1, 8, 10, 80, '2025-06-25 06:03:39'),
(29, 'kathan', 1, 8, 10, 80, '2025-06-25 06:04:43'),
(30, 'kathan', 1, 8, 10, 80, '2025-06-25 06:07:30'),
(31, 'kathan', 1, 8, 10, 80, '2025-06-25 06:08:04'),
(32, 'kathan', 1, 8, 10, 80, '2025-06-25 06:08:22'),
(33, 'kathan', 1, 8, 10, 80, '2025-06-25 06:09:01'),
(34, 'kathan', 1, 8, 10, 80, '2025-06-25 06:10:17'),
(35, 'kathan', 1, 8, 10, 80, '2025-06-25 06:11:07'),
(36, 'kathan', 1, 7, 10, 70, '2025-06-25 09:55:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_quiz_score_id` (`user_quiz_score_id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_quiz_scores`
--
ALTER TABLE `user_quiz_scores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_quiz_scores`
--
ALTER TABLE `user_quiz_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`user_quiz_score_id`) REFERENCES `user_quiz_scores` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
