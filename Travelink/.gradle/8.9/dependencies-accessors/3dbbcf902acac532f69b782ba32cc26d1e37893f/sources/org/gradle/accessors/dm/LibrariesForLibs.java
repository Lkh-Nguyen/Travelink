package org.gradle.accessors.dm;

import org.gradle.api.NonNullApi;
import org.gradle.api.artifacts.MinimalExternalModuleDependency;
import org.gradle.plugin.use.PluginDependency;
import org.gradle.api.artifacts.ExternalModuleDependencyBundle;
import org.gradle.api.artifacts.MutableVersionConstraint;
import org.gradle.api.provider.Provider;
import org.gradle.api.model.ObjectFactory;
import org.gradle.api.provider.ProviderFactory;
import org.gradle.api.internal.catalog.AbstractExternalDependencyFactory;
import org.gradle.api.internal.catalog.DefaultVersionCatalog;
import java.util.Map;
import org.gradle.api.internal.attributes.ImmutableAttributesFactory;
import org.gradle.api.internal.artifacts.dsl.CapabilityNotationParser;
import javax.inject.Inject;

/**
 * A catalog of dependencies accessible via the {@code libs} extension.
 */
@NonNullApi
public class LibrariesForLibs extends AbstractExternalDependencyFactory {

    private final AbstractExternalDependencyFactory owner = this;
    private final ComLibraryAccessors laccForComLibraryAccessors = new ComLibraryAccessors(owner);
    private final CommonsLibraryAccessors laccForCommonsLibraryAccessors = new CommonsLibraryAccessors(owner);
    private final JakartaLibraryAccessors laccForJakartaLibraryAccessors = new JakartaLibraryAccessors(owner);
    private final OrgLibraryAccessors laccForOrgLibraryAccessors = new OrgLibraryAccessors(owner);
    private final VersionAccessors vaccForVersionAccessors = new VersionAccessors(providers, config);
    private final BundleAccessors baccForBundleAccessors = new BundleAccessors(objects, providers, config, attributesFactory, capabilityNotationParser);
    private final PluginAccessors paccForPluginAccessors = new PluginAccessors(providers, config);

    @Inject
    public LibrariesForLibs(DefaultVersionCatalog config, ProviderFactory providers, ObjectFactory objects, ImmutableAttributesFactory attributesFactory, CapabilityNotationParser capabilityNotationParser) {
        super(config, providers, objects, attributesFactory, capabilityNotationParser);
    }

    /**
     * Group of libraries at <b>com</b>
     */
    public ComLibraryAccessors getCom() {
        return laccForComLibraryAccessors;
    }

    /**
     * Group of libraries at <b>commons</b>
     */
    public CommonsLibraryAccessors getCommons() {
        return laccForCommonsLibraryAccessors;
    }

    /**
     * Group of libraries at <b>jakarta</b>
     */
    public JakartaLibraryAccessors getJakarta() {
        return laccForJakartaLibraryAccessors;
    }

    /**
     * Group of libraries at <b>org</b>
     */
    public OrgLibraryAccessors getOrg() {
        return laccForOrgLibraryAccessors;
    }

    /**
     * Group of versions at <b>versions</b>
     */
    public VersionAccessors getVersions() {
        return vaccForVersionAccessors;
    }

    /**
     * Group of bundles at <b>bundles</b>
     */
    public BundleAccessors getBundles() {
        return baccForBundleAccessors;
    }

    /**
     * Group of plugins at <b>plugins</b>
     */
    public PluginAccessors getPlugins() {
        return paccForPluginAccessors;
    }

    public static class ComLibraryAccessors extends SubDependencyFactory {
        private final ComGoogleLibraryAccessors laccForComGoogleLibraryAccessors = new ComGoogleLibraryAccessors(owner);
        private final ComMicrosoftLibraryAccessors laccForComMicrosoftLibraryAccessors = new ComMicrosoftLibraryAccessors(owner);
        private final ComOpenhtmltopdfLibraryAccessors laccForComOpenhtmltopdfLibraryAccessors = new ComOpenhtmltopdfLibraryAccessors(owner);
        private final ComSunLibraryAccessors laccForComSunLibraryAccessors = new ComSunLibraryAccessors(owner);

        public ComLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.google</b>
         */
        public ComGoogleLibraryAccessors getGoogle() {
            return laccForComGoogleLibraryAccessors;
        }

        /**
         * Group of libraries at <b>com.microsoft</b>
         */
        public ComMicrosoftLibraryAccessors getMicrosoft() {
            return laccForComMicrosoftLibraryAccessors;
        }

        /**
         * Group of libraries at <b>com.openhtmltopdf</b>
         */
        public ComOpenhtmltopdfLibraryAccessors getOpenhtmltopdf() {
            return laccForComOpenhtmltopdfLibraryAccessors;
        }

        /**
         * Group of libraries at <b>com.sun</b>
         */
        public ComSunLibraryAccessors getSun() {
            return laccForComSunLibraryAccessors;
        }

    }

    public static class ComGoogleLibraryAccessors extends SubDependencyFactory {
        private final ComGoogleCodeLibraryAccessors laccForComGoogleCodeLibraryAccessors = new ComGoogleCodeLibraryAccessors(owner);

        public ComGoogleLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.google.code</b>
         */
        public ComGoogleCodeLibraryAccessors getCode() {
            return laccForComGoogleCodeLibraryAccessors;
        }

    }

    public static class ComGoogleCodeLibraryAccessors extends SubDependencyFactory {
        private final ComGoogleCodeGsonLibraryAccessors laccForComGoogleCodeGsonLibraryAccessors = new ComGoogleCodeGsonLibraryAccessors(owner);

        public ComGoogleCodeLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.google.code.gson</b>
         */
        public ComGoogleCodeGsonLibraryAccessors getGson() {
            return laccForComGoogleCodeGsonLibraryAccessors;
        }

    }

    public static class ComGoogleCodeGsonLibraryAccessors extends SubDependencyFactory {

        public ComGoogleCodeGsonLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>gson</b> with <b>com.google.code.gson:gson</b> coordinates and
         * with version reference <b>com.google.code.gson.gson</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getGson() {
            return create("com.google.code.gson.gson");
        }

    }

    public static class ComMicrosoftLibraryAccessors extends SubDependencyFactory {
        private final ComMicrosoftSqlserverLibraryAccessors laccForComMicrosoftSqlserverLibraryAccessors = new ComMicrosoftSqlserverLibraryAccessors(owner);

        public ComMicrosoftLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.microsoft.sqlserver</b>
         */
        public ComMicrosoftSqlserverLibraryAccessors getSqlserver() {
            return laccForComMicrosoftSqlserverLibraryAccessors;
        }

    }

    public static class ComMicrosoftSqlserverLibraryAccessors extends SubDependencyFactory {
        private final ComMicrosoftSqlserverMssqlLibraryAccessors laccForComMicrosoftSqlserverMssqlLibraryAccessors = new ComMicrosoftSqlserverMssqlLibraryAccessors(owner);

        public ComMicrosoftSqlserverLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.microsoft.sqlserver.mssql</b>
         */
        public ComMicrosoftSqlserverMssqlLibraryAccessors getMssql() {
            return laccForComMicrosoftSqlserverMssqlLibraryAccessors;
        }

    }

    public static class ComMicrosoftSqlserverMssqlLibraryAccessors extends SubDependencyFactory {

        public ComMicrosoftSqlserverMssqlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>jdbc</b> with <b>com.microsoft.sqlserver:mssql-jdbc</b> coordinates and
         * with version reference <b>com.microsoft.sqlserver.mssql.jdbc</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getJdbc() {
            return create("com.microsoft.sqlserver.mssql.jdbc");
        }

    }

    public static class ComOpenhtmltopdfLibraryAccessors extends SubDependencyFactory {
        private final ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors laccForComOpenhtmltopdfOpenhtmltopdfLibraryAccessors = new ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors(owner);

        public ComOpenhtmltopdfLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.openhtmltopdf.openhtmltopdf</b>
         */
        public ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors getOpenhtmltopdf() {
            return laccForComOpenhtmltopdfOpenhtmltopdfLibraryAccessors;
        }

    }

    public static class ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors extends SubDependencyFactory {

        public ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>pdfbox</b> with <b>com.openhtmltopdf:openhtmltopdf-pdfbox</b> coordinates and
         * with version reference <b>com.openhtmltopdf.openhtmltopdf.pdfbox</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getPdfbox() {
            return create("com.openhtmltopdf.openhtmltopdf.pdfbox");
        }

    }

    public static class ComSunLibraryAccessors extends SubDependencyFactory {
        private final ComSunMailLibraryAccessors laccForComSunMailLibraryAccessors = new ComSunMailLibraryAccessors(owner);

        public ComSunLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.sun.mail</b>
         */
        public ComSunMailLibraryAccessors getMail() {
            return laccForComSunMailLibraryAccessors;
        }

    }

    public static class ComSunMailLibraryAccessors extends SubDependencyFactory {
        private final ComSunMailJavaxLibraryAccessors laccForComSunMailJavaxLibraryAccessors = new ComSunMailJavaxLibraryAccessors(owner);

        public ComSunMailLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.sun.mail.javax</b>
         */
        public ComSunMailJavaxLibraryAccessors getJavax() {
            return laccForComSunMailJavaxLibraryAccessors;
        }

    }

    public static class ComSunMailJavaxLibraryAccessors extends SubDependencyFactory {

        public ComSunMailJavaxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>mail</b> with <b>com.sun.mail:javax.mail</b> coordinates and
         * with version reference <b>com.sun.mail.javax.mail</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getMail() {
            return create("com.sun.mail.javax.mail");
        }

    }

    public static class CommonsLibraryAccessors extends SubDependencyFactory {
        private final CommonsFileuploadLibraryAccessors laccForCommonsFileuploadLibraryAccessors = new CommonsFileuploadLibraryAccessors(owner);
        private final CommonsIoLibraryAccessors laccForCommonsIoLibraryAccessors = new CommonsIoLibraryAccessors(owner);
        private final CommonsLoggingLibraryAccessors laccForCommonsLoggingLibraryAccessors = new CommonsLoggingLibraryAccessors(owner);

        public CommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>commons.fileupload</b>
         */
        public CommonsFileuploadLibraryAccessors getFileupload() {
            return laccForCommonsFileuploadLibraryAccessors;
        }

        /**
         * Group of libraries at <b>commons.io</b>
         */
        public CommonsIoLibraryAccessors getIo() {
            return laccForCommonsIoLibraryAccessors;
        }

        /**
         * Group of libraries at <b>commons.logging</b>
         */
        public CommonsLoggingLibraryAccessors getLogging() {
            return laccForCommonsLoggingLibraryAccessors;
        }

    }

    public static class CommonsFileuploadLibraryAccessors extends SubDependencyFactory {
        private final CommonsFileuploadCommonsLibraryAccessors laccForCommonsFileuploadCommonsLibraryAccessors = new CommonsFileuploadCommonsLibraryAccessors(owner);

        public CommonsFileuploadLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>commons.fileupload.commons</b>
         */
        public CommonsFileuploadCommonsLibraryAccessors getCommons() {
            return laccForCommonsFileuploadCommonsLibraryAccessors;
        }

    }

    public static class CommonsFileuploadCommonsLibraryAccessors extends SubDependencyFactory {

        public CommonsFileuploadCommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>fileupload</b> with <b>commons-fileupload:commons-fileupload</b> coordinates and
         * with version reference <b>commons.fileupload.commons.fileupload</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getFileupload() {
            return create("commons.fileupload.commons.fileupload");
        }

    }

    public static class CommonsIoLibraryAccessors extends SubDependencyFactory {
        private final CommonsIoCommonsLibraryAccessors laccForCommonsIoCommonsLibraryAccessors = new CommonsIoCommonsLibraryAccessors(owner);

        public CommonsIoLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>commons.io.commons</b>
         */
        public CommonsIoCommonsLibraryAccessors getCommons() {
            return laccForCommonsIoCommonsLibraryAccessors;
        }

    }

    public static class CommonsIoCommonsLibraryAccessors extends SubDependencyFactory {

        public CommonsIoCommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>io</b> with <b>commons-io:commons-io</b> coordinates and
         * with version reference <b>commons.io.commons.io</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getIo() {
            return create("commons.io.commons.io");
        }

    }

    public static class CommonsLoggingLibraryAccessors extends SubDependencyFactory {
        private final CommonsLoggingCommonsLibraryAccessors laccForCommonsLoggingCommonsLibraryAccessors = new CommonsLoggingCommonsLibraryAccessors(owner);

        public CommonsLoggingLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>commons.logging.commons</b>
         */
        public CommonsLoggingCommonsLibraryAccessors getCommons() {
            return laccForCommonsLoggingCommonsLibraryAccessors;
        }

    }

    public static class CommonsLoggingCommonsLibraryAccessors extends SubDependencyFactory {

        public CommonsLoggingCommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>logging</b> with <b>commons-logging:commons-logging</b> coordinates and
         * with version reference <b>commons.logging.commons.logging</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getLogging() {
            return create("commons.logging.commons.logging");
        }

    }

    public static class JakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaPlatformLibraryAccessors laccForJakartaPlatformLibraryAccessors = new JakartaPlatformLibraryAccessors(owner);
        private final JakartaServletLibraryAccessors laccForJakartaServletLibraryAccessors = new JakartaServletLibraryAccessors(owner);
        private final JakartaWebsocketLibraryAccessors laccForJakartaWebsocketLibraryAccessors = new JakartaWebsocketLibraryAccessors(owner);
        private final JakartaXmlLibraryAccessors laccForJakartaXmlLibraryAccessors = new JakartaXmlLibraryAccessors(owner);

        public JakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.platform</b>
         */
        public JakartaPlatformLibraryAccessors getPlatform() {
            return laccForJakartaPlatformLibraryAccessors;
        }

        /**
         * Group of libraries at <b>jakarta.servlet</b>
         */
        public JakartaServletLibraryAccessors getServlet() {
            return laccForJakartaServletLibraryAccessors;
        }

        /**
         * Group of libraries at <b>jakarta.websocket</b>
         */
        public JakartaWebsocketLibraryAccessors getWebsocket() {
            return laccForJakartaWebsocketLibraryAccessors;
        }

        /**
         * Group of libraries at <b>jakarta.xml</b>
         */
        public JakartaXmlLibraryAccessors getXml() {
            return laccForJakartaXmlLibraryAccessors;
        }

    }

    public static class JakartaPlatformLibraryAccessors extends SubDependencyFactory {
        private final JakartaPlatformJakartaLibraryAccessors laccForJakartaPlatformJakartaLibraryAccessors = new JakartaPlatformJakartaLibraryAccessors(owner);

        public JakartaPlatformLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.platform.jakarta</b>
         */
        public JakartaPlatformJakartaLibraryAccessors getJakarta() {
            return laccForJakartaPlatformJakartaLibraryAccessors;
        }

    }

    public static class JakartaPlatformJakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaPlatformJakartaJakartaeeLibraryAccessors laccForJakartaPlatformJakartaJakartaeeLibraryAccessors = new JakartaPlatformJakartaJakartaeeLibraryAccessors(owner);

        public JakartaPlatformJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.platform.jakarta.jakartaee</b>
         */
        public JakartaPlatformJakartaJakartaeeLibraryAccessors getJakartaee() {
            return laccForJakartaPlatformJakartaJakartaeeLibraryAccessors;
        }

    }

    public static class JakartaPlatformJakartaJakartaeeLibraryAccessors extends SubDependencyFactory {

        public JakartaPlatformJakartaJakartaeeLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>jakarta.platform:jakarta.jakartaee-api</b> coordinates and
         * with version reference <b>jakarta.platform.jakarta.jakartaee.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getApi() {
            return create("jakarta.platform.jakarta.jakartaee.api");
        }

    }

    public static class JakartaServletLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspLibraryAccessors laccForJakartaServletJspLibraryAccessors = new JakartaServletJspLibraryAccessors(owner);

        public JakartaServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp</b>
         */
        public JakartaServletJspLibraryAccessors getJsp() {
            return laccForJakartaServletJspLibraryAccessors;
        }

    }

    public static class JakartaServletJspLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlLibraryAccessors laccForJakartaServletJspJstlLibraryAccessors = new JakartaServletJspJstlLibraryAccessors(owner);

        public JakartaServletJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl</b>
         */
        public JakartaServletJspJstlLibraryAccessors getJstl() {
            return laccForJakartaServletJspJstlLibraryAccessors;
        }

    }

    public static class JakartaServletJspJstlLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlJakartaLibraryAccessors laccForJakartaServletJspJstlJakartaLibraryAccessors = new JakartaServletJspJstlJakartaLibraryAccessors(owner);

        public JakartaServletJspJstlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl.jakarta</b>
         */
        public JakartaServletJspJstlJakartaLibraryAccessors getJakarta() {
            return laccForJakartaServletJspJstlJakartaLibraryAccessors;
        }

    }

    public static class JakartaServletJspJstlJakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlJakartaServletLibraryAccessors laccForJakartaServletJspJstlJakartaServletLibraryAccessors = new JakartaServletJspJstlJakartaServletLibraryAccessors(owner);

        public JakartaServletJspJstlJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl.jakarta.servlet</b>
         */
        public JakartaServletJspJstlJakartaServletLibraryAccessors getServlet() {
            return laccForJakartaServletJspJstlJakartaServletLibraryAccessors;
        }

    }

    public static class JakartaServletJspJstlJakartaServletLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlJakartaServletJspLibraryAccessors laccForJakartaServletJspJstlJakartaServletJspLibraryAccessors = new JakartaServletJspJstlJakartaServletJspLibraryAccessors(owner);

        public JakartaServletJspJstlJakartaServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl.jakarta.servlet.jsp</b>
         */
        public JakartaServletJspJstlJakartaServletJspLibraryAccessors getJsp() {
            return laccForJakartaServletJspJstlJakartaServletJspLibraryAccessors;
        }

    }

    public static class JakartaServletJspJstlJakartaServletJspLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors laccForJakartaServletJspJstlJakartaServletJspJstlLibraryAccessors = new JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors(owner);

        public JakartaServletJspJstlJakartaServletJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl.jakarta.servlet.jsp.jstl</b>
         */
        public JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors getJstl() {
            return laccForJakartaServletJspJstlJakartaServletJspJstlLibraryAccessors;
        }

    }

    public static class JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors extends SubDependencyFactory {

        public JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl-api</b> coordinates and
         * with version reference <b>jakarta.servlet.jsp.jstl.jakarta.servlet.jsp.jstl.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getApi() {
            return create("jakarta.servlet.jsp.jstl.jakarta.servlet.jsp.jstl.api");
        }

    }

    public static class JakartaWebsocketLibraryAccessors extends SubDependencyFactory {
        private final JakartaWebsocketJakartaLibraryAccessors laccForJakartaWebsocketJakartaLibraryAccessors = new JakartaWebsocketJakartaLibraryAccessors(owner);

        public JakartaWebsocketLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.websocket.jakarta</b>
         */
        public JakartaWebsocketJakartaLibraryAccessors getJakarta() {
            return laccForJakartaWebsocketJakartaLibraryAccessors;
        }

    }

    public static class JakartaWebsocketJakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaWebsocketJakartaWebsocketLibraryAccessors laccForJakartaWebsocketJakartaWebsocketLibraryAccessors = new JakartaWebsocketJakartaWebsocketLibraryAccessors(owner);

        public JakartaWebsocketJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.websocket.jakarta.websocket</b>
         */
        public JakartaWebsocketJakartaWebsocketLibraryAccessors getWebsocket() {
            return laccForJakartaWebsocketJakartaWebsocketLibraryAccessors;
        }

    }

    public static class JakartaWebsocketJakartaWebsocketLibraryAccessors extends SubDependencyFactory {

        public JakartaWebsocketJakartaWebsocketLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>jakarta.websocket:jakarta.websocket-api</b> coordinates and
         * with version reference <b>jakarta.websocket.jakarta.websocket.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getApi() {
            return create("jakarta.websocket.jakarta.websocket.api");
        }

    }

    public static class JakartaXmlLibraryAccessors extends SubDependencyFactory {
        private final JakartaXmlBindLibraryAccessors laccForJakartaXmlBindLibraryAccessors = new JakartaXmlBindLibraryAccessors(owner);

        public JakartaXmlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.xml.bind</b>
         */
        public JakartaXmlBindLibraryAccessors getBind() {
            return laccForJakartaXmlBindLibraryAccessors;
        }

    }

    public static class JakartaXmlBindLibraryAccessors extends SubDependencyFactory {
        private final JakartaXmlBindJakartaLibraryAccessors laccForJakartaXmlBindJakartaLibraryAccessors = new JakartaXmlBindJakartaLibraryAccessors(owner);

        public JakartaXmlBindLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.xml.bind.jakarta</b>
         */
        public JakartaXmlBindJakartaLibraryAccessors getJakarta() {
            return laccForJakartaXmlBindJakartaLibraryAccessors;
        }

    }

    public static class JakartaXmlBindJakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaXmlBindJakartaXmlLibraryAccessors laccForJakartaXmlBindJakartaXmlLibraryAccessors = new JakartaXmlBindJakartaXmlLibraryAccessors(owner);

        public JakartaXmlBindJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.xml.bind.jakarta.xml</b>
         */
        public JakartaXmlBindJakartaXmlLibraryAccessors getXml() {
            return laccForJakartaXmlBindJakartaXmlLibraryAccessors;
        }

    }

    public static class JakartaXmlBindJakartaXmlLibraryAccessors extends SubDependencyFactory {
        private final JakartaXmlBindJakartaXmlBindLibraryAccessors laccForJakartaXmlBindJakartaXmlBindLibraryAccessors = new JakartaXmlBindJakartaXmlBindLibraryAccessors(owner);

        public JakartaXmlBindJakartaXmlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.xml.bind.jakarta.xml.bind</b>
         */
        public JakartaXmlBindJakartaXmlBindLibraryAccessors getBind() {
            return laccForJakartaXmlBindJakartaXmlBindLibraryAccessors;
        }

    }

    public static class JakartaXmlBindJakartaXmlBindLibraryAccessors extends SubDependencyFactory {

        public JakartaXmlBindJakartaXmlBindLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>jakarta.xml.bind:jakarta.xml.bind-api</b> coordinates and
         * with version reference <b>jakarta.xml.bind.jakarta.xml.bind.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getApi() {
            return create("jakarta.xml.bind.jakarta.xml.bind.api");
        }

    }

    public static class OrgLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheLibraryAccessors laccForOrgApacheLibraryAccessors = new OrgApacheLibraryAccessors(owner);
        private final OrgGlassfishLibraryAccessors laccForOrgGlassfishLibraryAccessors = new OrgGlassfishLibraryAccessors(owner);
        private final OrgJsonLibraryAccessors laccForOrgJsonLibraryAccessors = new OrgJsonLibraryAccessors(owner);

        public OrgLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.apache</b>
         */
        public OrgApacheLibraryAccessors getApache() {
            return laccForOrgApacheLibraryAccessors;
        }

        /**
         * Group of libraries at <b>org.glassfish</b>
         */
        public OrgGlassfishLibraryAccessors getGlassfish() {
            return laccForOrgGlassfishLibraryAccessors;
        }

        /**
         * Group of libraries at <b>org.json</b>
         */
        public OrgJsonLibraryAccessors getJson() {
            return laccForOrgJsonLibraryAccessors;
        }

    }

    public static class OrgApacheLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheHttpcomponentsLibraryAccessors laccForOrgApacheHttpcomponentsLibraryAccessors = new OrgApacheHttpcomponentsLibraryAccessors(owner);

        public OrgApacheLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.apache.httpcomponents</b>
         */
        public OrgApacheHttpcomponentsLibraryAccessors getHttpcomponents() {
            return laccForOrgApacheHttpcomponentsLibraryAccessors;
        }

    }

    public static class OrgApacheHttpcomponentsLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheHttpcomponentsFluentLibraryAccessors laccForOrgApacheHttpcomponentsFluentLibraryAccessors = new OrgApacheHttpcomponentsFluentLibraryAccessors(owner);

        public OrgApacheHttpcomponentsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>httpclient</b> with <b>org.apache.httpcomponents:httpclient</b> coordinates and
         * with version reference <b>org.apache.httpcomponents.httpclient</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getHttpclient() {
            return create("org.apache.httpcomponents.httpclient");
        }

        /**
         * Dependency provider for <b>httpcore</b> with <b>org.apache.httpcomponents:httpcore</b> coordinates and
         * with version reference <b>org.apache.httpcomponents.httpcore</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getHttpcore() {
            return create("org.apache.httpcomponents.httpcore");
        }

        /**
         * Group of libraries at <b>org.apache.httpcomponents.fluent</b>
         */
        public OrgApacheHttpcomponentsFluentLibraryAccessors getFluent() {
            return laccForOrgApacheHttpcomponentsFluentLibraryAccessors;
        }

    }

    public static class OrgApacheHttpcomponentsFluentLibraryAccessors extends SubDependencyFactory {

        public OrgApacheHttpcomponentsFluentLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>hc</b> with <b>org.apache.httpcomponents:fluent-hc</b> coordinates and
         * with version reference <b>org.apache.httpcomponents.fluent.hc</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getHc() {
            return create("org.apache.httpcomponents.fluent.hc");
        }

    }

    public static class OrgGlassfishLibraryAccessors extends SubDependencyFactory {
        private final OrgGlassfishWebLibraryAccessors laccForOrgGlassfishWebLibraryAccessors = new OrgGlassfishWebLibraryAccessors(owner);

        public OrgGlassfishLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.glassfish.web</b>
         */
        public OrgGlassfishWebLibraryAccessors getWeb() {
            return laccForOrgGlassfishWebLibraryAccessors;
        }

    }

    public static class OrgGlassfishWebLibraryAccessors extends SubDependencyFactory {
        private final OrgGlassfishWebJakartaLibraryAccessors laccForOrgGlassfishWebJakartaLibraryAccessors = new OrgGlassfishWebJakartaLibraryAccessors(owner);

        public OrgGlassfishWebLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.glassfish.web.jakarta</b>
         */
        public OrgGlassfishWebJakartaLibraryAccessors getJakarta() {
            return laccForOrgGlassfishWebJakartaLibraryAccessors;
        }

    }

    public static class OrgGlassfishWebJakartaLibraryAccessors extends SubDependencyFactory {
        private final OrgGlassfishWebJakartaServletLibraryAccessors laccForOrgGlassfishWebJakartaServletLibraryAccessors = new OrgGlassfishWebJakartaServletLibraryAccessors(owner);

        public OrgGlassfishWebJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.glassfish.web.jakarta.servlet</b>
         */
        public OrgGlassfishWebJakartaServletLibraryAccessors getServlet() {
            return laccForOrgGlassfishWebJakartaServletLibraryAccessors;
        }

    }

    public static class OrgGlassfishWebJakartaServletLibraryAccessors extends SubDependencyFactory {
        private final OrgGlassfishWebJakartaServletJspLibraryAccessors laccForOrgGlassfishWebJakartaServletJspLibraryAccessors = new OrgGlassfishWebJakartaServletJspLibraryAccessors(owner);

        public OrgGlassfishWebJakartaServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.glassfish.web.jakarta.servlet.jsp</b>
         */
        public OrgGlassfishWebJakartaServletJspLibraryAccessors getJsp() {
            return laccForOrgGlassfishWebJakartaServletJspLibraryAccessors;
        }

    }

    public static class OrgGlassfishWebJakartaServletJspLibraryAccessors extends SubDependencyFactory {

        public OrgGlassfishWebJakartaServletJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>jstl</b> with <b>org.glassfish.web:jakarta.servlet.jsp.jstl</b> coordinates and
         * with version reference <b>org.glassfish.web.jakarta.servlet.jsp.jstl</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getJstl() {
            return create("org.glassfish.web.jakarta.servlet.jsp.jstl");
        }

    }

    public static class OrgJsonLibraryAccessors extends SubDependencyFactory {

        public OrgJsonLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>json</b> with <b>org.json:json</b> coordinates and
         * with version reference <b>org.json.json</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         */
        public Provider<MinimalExternalModuleDependency> getJson() {
            return create("org.json.json");
        }

    }

    public static class VersionAccessors extends VersionFactory  {

        private final ComVersionAccessors vaccForComVersionAccessors = new ComVersionAccessors(providers, config);
        private final CommonsVersionAccessors vaccForCommonsVersionAccessors = new CommonsVersionAccessors(providers, config);
        private final JakartaVersionAccessors vaccForJakartaVersionAccessors = new JakartaVersionAccessors(providers, config);
        private final OrgVersionAccessors vaccForOrgVersionAccessors = new OrgVersionAccessors(providers, config);
        public VersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com</b>
         */
        public ComVersionAccessors getCom() {
            return vaccForComVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.commons</b>
         */
        public CommonsVersionAccessors getCommons() {
            return vaccForCommonsVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.jakarta</b>
         */
        public JakartaVersionAccessors getJakarta() {
            return vaccForJakartaVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.org</b>
         */
        public OrgVersionAccessors getOrg() {
            return vaccForOrgVersionAccessors;
        }

    }

    public static class ComVersionAccessors extends VersionFactory  {

        private final ComGoogleVersionAccessors vaccForComGoogleVersionAccessors = new ComGoogleVersionAccessors(providers, config);
        private final ComMicrosoftVersionAccessors vaccForComMicrosoftVersionAccessors = new ComMicrosoftVersionAccessors(providers, config);
        private final ComOpenhtmltopdfVersionAccessors vaccForComOpenhtmltopdfVersionAccessors = new ComOpenhtmltopdfVersionAccessors(providers, config);
        private final ComSunVersionAccessors vaccForComSunVersionAccessors = new ComSunVersionAccessors(providers, config);
        public ComVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.google</b>
         */
        public ComGoogleVersionAccessors getGoogle() {
            return vaccForComGoogleVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.com.microsoft</b>
         */
        public ComMicrosoftVersionAccessors getMicrosoft() {
            return vaccForComMicrosoftVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.com.openhtmltopdf</b>
         */
        public ComOpenhtmltopdfVersionAccessors getOpenhtmltopdf() {
            return vaccForComOpenhtmltopdfVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.com.sun</b>
         */
        public ComSunVersionAccessors getSun() {
            return vaccForComSunVersionAccessors;
        }

    }

    public static class ComGoogleVersionAccessors extends VersionFactory  {

        private final ComGoogleCodeVersionAccessors vaccForComGoogleCodeVersionAccessors = new ComGoogleCodeVersionAccessors(providers, config);
        public ComGoogleVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.google.code</b>
         */
        public ComGoogleCodeVersionAccessors getCode() {
            return vaccForComGoogleCodeVersionAccessors;
        }

    }

    public static class ComGoogleCodeVersionAccessors extends VersionFactory  {

        private final ComGoogleCodeGsonVersionAccessors vaccForComGoogleCodeGsonVersionAccessors = new ComGoogleCodeGsonVersionAccessors(providers, config);
        public ComGoogleCodeVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.google.code.gson</b>
         */
        public ComGoogleCodeGsonVersionAccessors getGson() {
            return vaccForComGoogleCodeGsonVersionAccessors;
        }

    }

    public static class ComGoogleCodeGsonVersionAccessors extends VersionFactory  {

        public ComGoogleCodeGsonVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>com.google.code.gson.gson</b> with value <b>2.10.1</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getGson() { return getVersion("com.google.code.gson.gson"); }

    }

    public static class ComMicrosoftVersionAccessors extends VersionFactory  {

        private final ComMicrosoftSqlserverVersionAccessors vaccForComMicrosoftSqlserverVersionAccessors = new ComMicrosoftSqlserverVersionAccessors(providers, config);
        public ComMicrosoftVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.microsoft.sqlserver</b>
         */
        public ComMicrosoftSqlserverVersionAccessors getSqlserver() {
            return vaccForComMicrosoftSqlserverVersionAccessors;
        }

    }

    public static class ComMicrosoftSqlserverVersionAccessors extends VersionFactory  {

        private final ComMicrosoftSqlserverMssqlVersionAccessors vaccForComMicrosoftSqlserverMssqlVersionAccessors = new ComMicrosoftSqlserverMssqlVersionAccessors(providers, config);
        public ComMicrosoftSqlserverVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.microsoft.sqlserver.mssql</b>
         */
        public ComMicrosoftSqlserverMssqlVersionAccessors getMssql() {
            return vaccForComMicrosoftSqlserverMssqlVersionAccessors;
        }

    }

    public static class ComMicrosoftSqlserverMssqlVersionAccessors extends VersionFactory  {

        public ComMicrosoftSqlserverMssqlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>com.microsoft.sqlserver.mssql.jdbc</b> with value <b>12.7.0.jre11-preview</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getJdbc() { return getVersion("com.microsoft.sqlserver.mssql.jdbc"); }

    }

    public static class ComOpenhtmltopdfVersionAccessors extends VersionFactory  {

        private final ComOpenhtmltopdfOpenhtmltopdfVersionAccessors vaccForComOpenhtmltopdfOpenhtmltopdfVersionAccessors = new ComOpenhtmltopdfOpenhtmltopdfVersionAccessors(providers, config);
        public ComOpenhtmltopdfVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.openhtmltopdf.openhtmltopdf</b>
         */
        public ComOpenhtmltopdfOpenhtmltopdfVersionAccessors getOpenhtmltopdf() {
            return vaccForComOpenhtmltopdfOpenhtmltopdfVersionAccessors;
        }

    }

    public static class ComOpenhtmltopdfOpenhtmltopdfVersionAccessors extends VersionFactory  {

        public ComOpenhtmltopdfOpenhtmltopdfVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>com.openhtmltopdf.openhtmltopdf.pdfbox</b> with value <b>1.0.10</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getPdfbox() { return getVersion("com.openhtmltopdf.openhtmltopdf.pdfbox"); }

    }

    public static class ComSunVersionAccessors extends VersionFactory  {

        private final ComSunMailVersionAccessors vaccForComSunMailVersionAccessors = new ComSunMailVersionAccessors(providers, config);
        public ComSunVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.sun.mail</b>
         */
        public ComSunMailVersionAccessors getMail() {
            return vaccForComSunMailVersionAccessors;
        }

    }

    public static class ComSunMailVersionAccessors extends VersionFactory  {

        private final ComSunMailJavaxVersionAccessors vaccForComSunMailJavaxVersionAccessors = new ComSunMailJavaxVersionAccessors(providers, config);
        public ComSunMailVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.sun.mail.javax</b>
         */
        public ComSunMailJavaxVersionAccessors getJavax() {
            return vaccForComSunMailJavaxVersionAccessors;
        }

    }

    public static class ComSunMailJavaxVersionAccessors extends VersionFactory  {

        public ComSunMailJavaxVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>com.sun.mail.javax.mail</b> with value <b>1.5.5</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getMail() { return getVersion("com.sun.mail.javax.mail"); }

    }

    public static class CommonsVersionAccessors extends VersionFactory  {

        private final CommonsFileuploadVersionAccessors vaccForCommonsFileuploadVersionAccessors = new CommonsFileuploadVersionAccessors(providers, config);
        private final CommonsIoVersionAccessors vaccForCommonsIoVersionAccessors = new CommonsIoVersionAccessors(providers, config);
        private final CommonsLoggingVersionAccessors vaccForCommonsLoggingVersionAccessors = new CommonsLoggingVersionAccessors(providers, config);
        public CommonsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.commons.fileupload</b>
         */
        public CommonsFileuploadVersionAccessors getFileupload() {
            return vaccForCommonsFileuploadVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.commons.io</b>
         */
        public CommonsIoVersionAccessors getIo() {
            return vaccForCommonsIoVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.commons.logging</b>
         */
        public CommonsLoggingVersionAccessors getLogging() {
            return vaccForCommonsLoggingVersionAccessors;
        }

    }

    public static class CommonsFileuploadVersionAccessors extends VersionFactory  {

        private final CommonsFileuploadCommonsVersionAccessors vaccForCommonsFileuploadCommonsVersionAccessors = new CommonsFileuploadCommonsVersionAccessors(providers, config);
        public CommonsFileuploadVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.commons.fileupload.commons</b>
         */
        public CommonsFileuploadCommonsVersionAccessors getCommons() {
            return vaccForCommonsFileuploadCommonsVersionAccessors;
        }

    }

    public static class CommonsFileuploadCommonsVersionAccessors extends VersionFactory  {

        public CommonsFileuploadCommonsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>commons.fileupload.commons.fileupload</b> with value <b>1.5</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getFileupload() { return getVersion("commons.fileupload.commons.fileupload"); }

    }

    public static class CommonsIoVersionAccessors extends VersionFactory  {

        private final CommonsIoCommonsVersionAccessors vaccForCommonsIoCommonsVersionAccessors = new CommonsIoCommonsVersionAccessors(providers, config);
        public CommonsIoVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.commons.io.commons</b>
         */
        public CommonsIoCommonsVersionAccessors getCommons() {
            return vaccForCommonsIoCommonsVersionAccessors;
        }

    }

    public static class CommonsIoCommonsVersionAccessors extends VersionFactory  {

        public CommonsIoCommonsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>commons.io.commons.io</b> with value <b>2.6</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getIo() { return getVersion("commons.io.commons.io"); }

    }

    public static class CommonsLoggingVersionAccessors extends VersionFactory  {

        private final CommonsLoggingCommonsVersionAccessors vaccForCommonsLoggingCommonsVersionAccessors = new CommonsLoggingCommonsVersionAccessors(providers, config);
        public CommonsLoggingVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.commons.logging.commons</b>
         */
        public CommonsLoggingCommonsVersionAccessors getCommons() {
            return vaccForCommonsLoggingCommonsVersionAccessors;
        }

    }

    public static class CommonsLoggingCommonsVersionAccessors extends VersionFactory  {

        public CommonsLoggingCommonsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>commons.logging.commons.logging</b> with value <b>1.3.2</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getLogging() { return getVersion("commons.logging.commons.logging"); }

    }

    public static class JakartaVersionAccessors extends VersionFactory  {

        private final JakartaPlatformVersionAccessors vaccForJakartaPlatformVersionAccessors = new JakartaPlatformVersionAccessors(providers, config);
        private final JakartaServletVersionAccessors vaccForJakartaServletVersionAccessors = new JakartaServletVersionAccessors(providers, config);
        private final JakartaWebsocketVersionAccessors vaccForJakartaWebsocketVersionAccessors = new JakartaWebsocketVersionAccessors(providers, config);
        private final JakartaXmlVersionAccessors vaccForJakartaXmlVersionAccessors = new JakartaXmlVersionAccessors(providers, config);
        public JakartaVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.platform</b>
         */
        public JakartaPlatformVersionAccessors getPlatform() {
            return vaccForJakartaPlatformVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.jakarta.servlet</b>
         */
        public JakartaServletVersionAccessors getServlet() {
            return vaccForJakartaServletVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.jakarta.websocket</b>
         */
        public JakartaWebsocketVersionAccessors getWebsocket() {
            return vaccForJakartaWebsocketVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.jakarta.xml</b>
         */
        public JakartaXmlVersionAccessors getXml() {
            return vaccForJakartaXmlVersionAccessors;
        }

    }

    public static class JakartaPlatformVersionAccessors extends VersionFactory  {

        private final JakartaPlatformJakartaVersionAccessors vaccForJakartaPlatformJakartaVersionAccessors = new JakartaPlatformJakartaVersionAccessors(providers, config);
        public JakartaPlatformVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.platform.jakarta</b>
         */
        public JakartaPlatformJakartaVersionAccessors getJakarta() {
            return vaccForJakartaPlatformJakartaVersionAccessors;
        }

    }

    public static class JakartaPlatformJakartaVersionAccessors extends VersionFactory  {

        private final JakartaPlatformJakartaJakartaeeVersionAccessors vaccForJakartaPlatformJakartaJakartaeeVersionAccessors = new JakartaPlatformJakartaJakartaeeVersionAccessors(providers, config);
        public JakartaPlatformJakartaVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.platform.jakarta.jakartaee</b>
         */
        public JakartaPlatformJakartaJakartaeeVersionAccessors getJakartaee() {
            return vaccForJakartaPlatformJakartaJakartaeeVersionAccessors;
        }

    }

    public static class JakartaPlatformJakartaJakartaeeVersionAccessors extends VersionFactory  {

        public JakartaPlatformJakartaJakartaeeVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>jakarta.platform.jakarta.jakartaee.api</b> with value <b>10.0.0</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getApi() { return getVersion("jakarta.platform.jakarta.jakartaee.api"); }

    }

    public static class JakartaServletVersionAccessors extends VersionFactory  {

        private final JakartaServletJspVersionAccessors vaccForJakartaServletJspVersionAccessors = new JakartaServletJspVersionAccessors(providers, config);
        public JakartaServletVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.servlet.jsp</b>
         */
        public JakartaServletJspVersionAccessors getJsp() {
            return vaccForJakartaServletJspVersionAccessors;
        }

    }

    public static class JakartaServletJspVersionAccessors extends VersionFactory  {

        private final JakartaServletJspJstlVersionAccessors vaccForJakartaServletJspJstlVersionAccessors = new JakartaServletJspJstlVersionAccessors(providers, config);
        public JakartaServletJspVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.servlet.jsp.jstl</b>
         */
        public JakartaServletJspJstlVersionAccessors getJstl() {
            return vaccForJakartaServletJspJstlVersionAccessors;
        }

    }

    public static class JakartaServletJspJstlVersionAccessors extends VersionFactory  {

        private final JakartaServletJspJstlJakartaVersionAccessors vaccForJakartaServletJspJstlJakartaVersionAccessors = new JakartaServletJspJstlJakartaVersionAccessors(providers, config);
        public JakartaServletJspJstlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.servlet.jsp.jstl.jakarta</b>
         */
        public JakartaServletJspJstlJakartaVersionAccessors getJakarta() {
            return vaccForJakartaServletJspJstlJakartaVersionAccessors;
        }

    }

    public static class JakartaServletJspJstlJakartaVersionAccessors extends VersionFactory  {

        private final JakartaServletJspJstlJakartaServletVersionAccessors vaccForJakartaServletJspJstlJakartaServletVersionAccessors = new JakartaServletJspJstlJakartaServletVersionAccessors(providers, config);
        public JakartaServletJspJstlJakartaVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.servlet.jsp.jstl.jakarta.servlet</b>
         */
        public JakartaServletJspJstlJakartaServletVersionAccessors getServlet() {
            return vaccForJakartaServletJspJstlJakartaServletVersionAccessors;
        }

    }

    public static class JakartaServletJspJstlJakartaServletVersionAccessors extends VersionFactory  {

        private final JakartaServletJspJstlJakartaServletJspVersionAccessors vaccForJakartaServletJspJstlJakartaServletJspVersionAccessors = new JakartaServletJspJstlJakartaServletJspVersionAccessors(providers, config);
        public JakartaServletJspJstlJakartaServletVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.servlet.jsp.jstl.jakarta.servlet.jsp</b>
         */
        public JakartaServletJspJstlJakartaServletJspVersionAccessors getJsp() {
            return vaccForJakartaServletJspJstlJakartaServletJspVersionAccessors;
        }

    }

    public static class JakartaServletJspJstlJakartaServletJspVersionAccessors extends VersionFactory  {

        private final JakartaServletJspJstlJakartaServletJspJstlVersionAccessors vaccForJakartaServletJspJstlJakartaServletJspJstlVersionAccessors = new JakartaServletJspJstlJakartaServletJspJstlVersionAccessors(providers, config);
        public JakartaServletJspJstlJakartaServletJspVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.servlet.jsp.jstl.jakarta.servlet.jsp.jstl</b>
         */
        public JakartaServletJspJstlJakartaServletJspJstlVersionAccessors getJstl() {
            return vaccForJakartaServletJspJstlJakartaServletJspJstlVersionAccessors;
        }

    }

    public static class JakartaServletJspJstlJakartaServletJspJstlVersionAccessors extends VersionFactory  {

        public JakartaServletJspJstlJakartaServletJspJstlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>jakarta.servlet.jsp.jstl.jakarta.servlet.jsp.jstl.api</b> with value <b>3.0.0</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getApi() { return getVersion("jakarta.servlet.jsp.jstl.jakarta.servlet.jsp.jstl.api"); }

    }

    public static class JakartaWebsocketVersionAccessors extends VersionFactory  {

        private final JakartaWebsocketJakartaVersionAccessors vaccForJakartaWebsocketJakartaVersionAccessors = new JakartaWebsocketJakartaVersionAccessors(providers, config);
        public JakartaWebsocketVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.websocket.jakarta</b>
         */
        public JakartaWebsocketJakartaVersionAccessors getJakarta() {
            return vaccForJakartaWebsocketJakartaVersionAccessors;
        }

    }

    public static class JakartaWebsocketJakartaVersionAccessors extends VersionFactory  {

        private final JakartaWebsocketJakartaWebsocketVersionAccessors vaccForJakartaWebsocketJakartaWebsocketVersionAccessors = new JakartaWebsocketJakartaWebsocketVersionAccessors(providers, config);
        public JakartaWebsocketJakartaVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.websocket.jakarta.websocket</b>
         */
        public JakartaWebsocketJakartaWebsocketVersionAccessors getWebsocket() {
            return vaccForJakartaWebsocketJakartaWebsocketVersionAccessors;
        }

    }

    public static class JakartaWebsocketJakartaWebsocketVersionAccessors extends VersionFactory  {

        public JakartaWebsocketJakartaWebsocketVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>jakarta.websocket.jakarta.websocket.api</b> with value <b>2.0.0</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getApi() { return getVersion("jakarta.websocket.jakarta.websocket.api"); }

    }

    public static class JakartaXmlVersionAccessors extends VersionFactory  {

        private final JakartaXmlBindVersionAccessors vaccForJakartaXmlBindVersionAccessors = new JakartaXmlBindVersionAccessors(providers, config);
        public JakartaXmlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.xml.bind</b>
         */
        public JakartaXmlBindVersionAccessors getBind() {
            return vaccForJakartaXmlBindVersionAccessors;
        }

    }

    public static class JakartaXmlBindVersionAccessors extends VersionFactory  {

        private final JakartaXmlBindJakartaVersionAccessors vaccForJakartaXmlBindJakartaVersionAccessors = new JakartaXmlBindJakartaVersionAccessors(providers, config);
        public JakartaXmlBindVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.xml.bind.jakarta</b>
         */
        public JakartaXmlBindJakartaVersionAccessors getJakarta() {
            return vaccForJakartaXmlBindJakartaVersionAccessors;
        }

    }

    public static class JakartaXmlBindJakartaVersionAccessors extends VersionFactory  {

        private final JakartaXmlBindJakartaXmlVersionAccessors vaccForJakartaXmlBindJakartaXmlVersionAccessors = new JakartaXmlBindJakartaXmlVersionAccessors(providers, config);
        public JakartaXmlBindJakartaVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.xml.bind.jakarta.xml</b>
         */
        public JakartaXmlBindJakartaXmlVersionAccessors getXml() {
            return vaccForJakartaXmlBindJakartaXmlVersionAccessors;
        }

    }

    public static class JakartaXmlBindJakartaXmlVersionAccessors extends VersionFactory  {

        private final JakartaXmlBindJakartaXmlBindVersionAccessors vaccForJakartaXmlBindJakartaXmlBindVersionAccessors = new JakartaXmlBindJakartaXmlBindVersionAccessors(providers, config);
        public JakartaXmlBindJakartaXmlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.jakarta.xml.bind.jakarta.xml.bind</b>
         */
        public JakartaXmlBindJakartaXmlBindVersionAccessors getBind() {
            return vaccForJakartaXmlBindJakartaXmlBindVersionAccessors;
        }

    }

    public static class JakartaXmlBindJakartaXmlBindVersionAccessors extends VersionFactory  {

        public JakartaXmlBindJakartaXmlBindVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>jakarta.xml.bind.jakarta.xml.bind.api</b> with value <b>3.0.0</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getApi() { return getVersion("jakarta.xml.bind.jakarta.xml.bind.api"); }

    }

    public static class OrgVersionAccessors extends VersionFactory  {

        private final OrgApacheVersionAccessors vaccForOrgApacheVersionAccessors = new OrgApacheVersionAccessors(providers, config);
        private final OrgGlassfishVersionAccessors vaccForOrgGlassfishVersionAccessors = new OrgGlassfishVersionAccessors(providers, config);
        private final OrgJsonVersionAccessors vaccForOrgJsonVersionAccessors = new OrgJsonVersionAccessors(providers, config);
        public OrgVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.apache</b>
         */
        public OrgApacheVersionAccessors getApache() {
            return vaccForOrgApacheVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.org.glassfish</b>
         */
        public OrgGlassfishVersionAccessors getGlassfish() {
            return vaccForOrgGlassfishVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.org.json</b>
         */
        public OrgJsonVersionAccessors getJson() {
            return vaccForOrgJsonVersionAccessors;
        }

    }

    public static class OrgApacheVersionAccessors extends VersionFactory  {

        private final OrgApacheHttpcomponentsVersionAccessors vaccForOrgApacheHttpcomponentsVersionAccessors = new OrgApacheHttpcomponentsVersionAccessors(providers, config);
        public OrgApacheVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.apache.httpcomponents</b>
         */
        public OrgApacheHttpcomponentsVersionAccessors getHttpcomponents() {
            return vaccForOrgApacheHttpcomponentsVersionAccessors;
        }

    }

    public static class OrgApacheHttpcomponentsVersionAccessors extends VersionFactory  {

        private final OrgApacheHttpcomponentsFluentVersionAccessors vaccForOrgApacheHttpcomponentsFluentVersionAccessors = new OrgApacheHttpcomponentsFluentVersionAccessors(providers, config);
        public OrgApacheHttpcomponentsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>org.apache.httpcomponents.httpclient</b> with value <b>4.5.14</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getHttpclient() { return getVersion("org.apache.httpcomponents.httpclient"); }

        /**
         * Version alias <b>org.apache.httpcomponents.httpcore</b> with value <b>4.4.16</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getHttpcore() { return getVersion("org.apache.httpcomponents.httpcore"); }

        /**
         * Group of versions at <b>versions.org.apache.httpcomponents.fluent</b>
         */
        public OrgApacheHttpcomponentsFluentVersionAccessors getFluent() {
            return vaccForOrgApacheHttpcomponentsFluentVersionAccessors;
        }

    }

    public static class OrgApacheHttpcomponentsFluentVersionAccessors extends VersionFactory  {

        public OrgApacheHttpcomponentsFluentVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>org.apache.httpcomponents.fluent.hc</b> with value <b>4.5.14</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getHc() { return getVersion("org.apache.httpcomponents.fluent.hc"); }

    }

    public static class OrgGlassfishVersionAccessors extends VersionFactory  {

        private final OrgGlassfishWebVersionAccessors vaccForOrgGlassfishWebVersionAccessors = new OrgGlassfishWebVersionAccessors(providers, config);
        public OrgGlassfishVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.glassfish.web</b>
         */
        public OrgGlassfishWebVersionAccessors getWeb() {
            return vaccForOrgGlassfishWebVersionAccessors;
        }

    }

    public static class OrgGlassfishWebVersionAccessors extends VersionFactory  {

        private final OrgGlassfishWebJakartaVersionAccessors vaccForOrgGlassfishWebJakartaVersionAccessors = new OrgGlassfishWebJakartaVersionAccessors(providers, config);
        public OrgGlassfishWebVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.glassfish.web.jakarta</b>
         */
        public OrgGlassfishWebJakartaVersionAccessors getJakarta() {
            return vaccForOrgGlassfishWebJakartaVersionAccessors;
        }

    }

    public static class OrgGlassfishWebJakartaVersionAccessors extends VersionFactory  {

        private final OrgGlassfishWebJakartaServletVersionAccessors vaccForOrgGlassfishWebJakartaServletVersionAccessors = new OrgGlassfishWebJakartaServletVersionAccessors(providers, config);
        public OrgGlassfishWebJakartaVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.glassfish.web.jakarta.servlet</b>
         */
        public OrgGlassfishWebJakartaServletVersionAccessors getServlet() {
            return vaccForOrgGlassfishWebJakartaServletVersionAccessors;
        }

    }

    public static class OrgGlassfishWebJakartaServletVersionAccessors extends VersionFactory  {

        private final OrgGlassfishWebJakartaServletJspVersionAccessors vaccForOrgGlassfishWebJakartaServletJspVersionAccessors = new OrgGlassfishWebJakartaServletJspVersionAccessors(providers, config);
        public OrgGlassfishWebJakartaServletVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.glassfish.web.jakarta.servlet.jsp</b>
         */
        public OrgGlassfishWebJakartaServletJspVersionAccessors getJsp() {
            return vaccForOrgGlassfishWebJakartaServletJspVersionAccessors;
        }

    }

    public static class OrgGlassfishWebJakartaServletJspVersionAccessors extends VersionFactory  {

        public OrgGlassfishWebJakartaServletJspVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>org.glassfish.web.jakarta.servlet.jsp.jstl</b> with value <b>3.0.1</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getJstl() { return getVersion("org.glassfish.web.jakarta.servlet.jsp.jstl"); }

    }

    public static class OrgJsonVersionAccessors extends VersionFactory  {

        public OrgJsonVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>org.json.json</b> with value <b>20210307</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getJson() { return getVersion("org.json.json"); }

    }

    public static class BundleAccessors extends BundleFactory {

        public BundleAccessors(ObjectFactory objects, ProviderFactory providers, DefaultVersionCatalog config, ImmutableAttributesFactory attributesFactory, CapabilityNotationParser capabilityNotationParser) { super(objects, providers, config, attributesFactory, capabilityNotationParser); }

    }

    public static class PluginAccessors extends PluginFactory {

        public PluginAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

    }

}
