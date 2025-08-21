# Security Policy

## Supported Versions

We take security seriously and provide security updates for the following versions of the Taiwan Climate Change Rainfall Risk Dashboard:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |

## Reporting a Vulnerability

We appreciate responsible disclosure of security vulnerabilities. If you discover a security issue, please follow these steps:

### 🔒 Private Disclosure

**Please do NOT create a public GitHub issue for security vulnerabilities.**

Instead, please report security vulnerabilities by:

1. **Email**: Send details to [your-security-email@domain.com]
2. **Subject Line**: Use "SECURITY: Taiwan Climate Dashboard - [Brief Description]"
3. **Encryption**: For sensitive reports, use our PGP key [link to PGP key if available]

### 📝 What to Include

Please include the following information in your report:

- **Vulnerability Type**: (e.g., XSS, CSRF, Data Exposure, etc.)
- **Affected Component**: Which part of the application is affected
- **Steps to Reproduce**: Detailed steps to reproduce the vulnerability
- **Impact Assessment**: Potential impact of the vulnerability
- **Proof of Concept**: Screenshots, code snippets, or demonstration
- **Suggested Fix**: If you have suggestions for remediation

### 🕐 Response Timeline

We commit to the following response timeline:

- **Initial Response**: Within 48 hours of report
- **Assessment**: Within 7 days for initial assessment
- **Resolution**: Varies based on severity and complexity
- **Disclosure**: Coordinated disclosure after fix is deployed

### 🎯 Vulnerability Assessment Criteria

We assess vulnerabilities based on:

#### High Severity
- Remote code execution
- SQL injection
- Authentication bypass
- Sensitive data exposure
- CSRF with significant impact

#### Medium Severity
- Cross-site scripting (XSS)
- Information disclosure
- Privilege escalation
- Denial of service

#### Low Severity
- Minor information leakage
- Missing security headers
- Non-exploitable vulnerabilities

## Security Best Practices

### For Users
- **Keep Browser Updated**: Use latest browser versions
- **Secure Connection**: Always access via HTTPS
- **Report Issues**: Report suspicious behavior immediately

### For Developers
- **Input Validation**: All user inputs must be validated
- **Output Encoding**: Properly encode all outputs
- **Authentication**: Implement proper session management
- **Dependencies**: Keep all dependencies updated

## Application Security Measures

### Current Security Features

#### Data Protection
- **Input Sanitization**: All user inputs are sanitized
- **XSS Prevention**: HTML encoding and CSP headers
- **CSRF Protection**: Shiny's built-in CSRF protection
- **Secure Headers**: Security headers properly configured

#### Infrastructure Security
- **HTTPS Only**: All traffic encrypted in transit
- **Secure Deployment**: Deployed on secure cloud infrastructure
- **Access Logging**: Comprehensive access logging
- **Monitoring**: Real-time security monitoring

#### Code Security
- **Dependency Scanning**: Regular dependency vulnerability scans
- **Static Analysis**: Code analyzed for security issues
- **Secure Coding**: Following secure coding practices
- **Regular Updates**: Dependencies updated regularly

### Known Security Considerations

#### Data Privacy
- **No Personal Data**: Application does not collect personal information
- **Analytics**: Only anonymous usage analytics collected
- **Cookies**: Minimal cookie usage for session management
- **Third-Party**: Limited third-party integrations

#### Access Control
- **Public Application**: Designed for public access
- **No Authentication**: No user accounts or authentication system
- **Rate Limiting**: Basic rate limiting implemented
- **DDoS Protection**: Protected against basic DDoS attacks

## Vulnerability Disclosure Policy

### Our Commitment
- We will respond to all reports within 48 hours
- We will provide regular updates on progress
- We will credit reporters (if desired) after disclosure
- We will not take legal action against good-faith security research

### Scope
This policy applies to:
- The main application at [your-domain]
- All subdomains and related infrastructure
- Source code in this repository

### Out of Scope
The following are considered out of scope:
- Social engineering attacks
- Physical attacks
- Denial of service attacks
- Issues requiring physical access
- Vulnerabilities in third-party services beyond our control

### Safe Harbor
We consider security research conducted under this policy to be:
- Authorized regarding the Computer Fraud and Abuse Act
- Authorized regarding the Digital Millennium Copyright Act
- Exempt from restrictions in our Terms of Service
- Lawful and helpful to the overall security of the internet

## Security Updates

### Notification Process
- **Critical Updates**: Immediate notification via GitHub releases
- **Security Patches**: Documented in CHANGELOG.md
- **Dependencies**: Automated dependency update monitoring
- **Communication**: Security updates communicated to users

### Update Policy
- **Critical Vulnerabilities**: Fixed within 24-48 hours
- **High Severity**: Fixed within 7 days
- **Medium Severity**: Fixed within 30 days
- **Low Severity**: Fixed in next regular release

## Contact Information

### Security Team
- **Primary Contact**: [your-security-email@domain.com]
- **Backup Contact**: [backup-security-email@domain.com]
- **PGP Key**: [Link to PGP key if available]

### General Inquiries
For non-security related issues, please use:
- **GitHub Issues**: For bugs and feature requests
- **General Email**: [your-general-email@domain.com]

## Acknowledgments

We would like to thank the following individuals who have responsibly disclosed vulnerabilities:

*(No vulnerabilities reported yet)*

---

**Last Updated**: August 2025
**Version**: 1.0

*This security policy is subject to change. Please check this document regularly for updates.*
