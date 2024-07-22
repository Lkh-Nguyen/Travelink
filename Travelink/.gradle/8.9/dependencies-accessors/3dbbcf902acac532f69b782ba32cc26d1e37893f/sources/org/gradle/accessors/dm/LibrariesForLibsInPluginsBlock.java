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
public class LibrariesForLibsInPluginsBlock extends AbstractExternalDependencyFactory {

    private final AbstractExternalDependencyFactory owner = this;
    private final ComLibraryAccessors laccForComLibraryAccessors = new ComLibraryAccessors(owner);
    private final CommonsLibraryAccessors laccForCommonsLibraryAccessors = new CommonsLibraryAccessors(owner);
    private final JakartaLibraryAccessors laccForJakartaLibraryAccessors = new JakartaLibraryAccessors(owner);
    private final OrgLibraryAccessors laccForOrgLibraryAccessors = new OrgLibraryAccessors(owner);
    private final VersionAccessors vaccForVersionAccessors = new VersionAccessors(providers, config);
    private final BundleAccessors baccForBundleAccessors = new BundleAccessors(objects, providers, config, attributesFactory, capabilityNotationParser);
    private final PluginAccessors paccForPluginAccessors = new PluginAccessors(providers, config);

    @Inject
    public LibrariesForLibsInPluginsBlock(DefaultVersionCatalog config, ProviderFactory providers, ObjectFactory objects, ImmutableAttributesFactory attributesFactory, CapabilityNotationParser capabilityNotationParser) {
        super(config, providers, objects, attributesFactory, capabilityNotationParser);
    }

    /**
     * Group of libraries at <b>com</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public ComLibraryAccessors getCom() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return laccForComLibraryAccessors;
    }

    /**
     * Group of libraries at <b>commons</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public CommonsLibraryAccessors getCommons() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return laccForCommonsLibraryAccessors;
    }

    /**
     * Group of libraries at <b>jakarta</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public JakartaLibraryAccessors getJakarta() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return laccForJakartaLibraryAccessors;
    }

    /**
     * Group of libraries at <b>org</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public OrgLibraryAccessors getOrg() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
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
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public BundleAccessors getBundles() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return baccForBundleAccessors;
    }

    /**
     * Group of plugins at <b>plugins</b>
     */
    public PluginAccessors getPlugins() {
        return paccForPluginAccessors;
    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComLibraryAccessors extends SubDependencyFactory {
        private final ComGoogleLibraryAccessors laccForComGoogleLibraryAccessors = new ComGoogleLibraryAccessors(owner);
        private final ComMicrosoftLibraryAccessors laccForComMicrosoftLibraryAccessors = new ComMicrosoftLibraryAccessors(owner);
        private final ComOpenhtmltopdfLibraryAccessors laccForComOpenhtmltopdfLibraryAccessors = new ComOpenhtmltopdfLibraryAccessors(owner);
        private final ComSunLibraryAccessors laccForComSunLibraryAccessors = new ComSunLibraryAccessors(owner);

        public ComLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.google</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComGoogleLibraryAccessors getGoogle() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComGoogleLibraryAccessors;
        }

        /**
         * Group of libraries at <b>com.microsoft</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComMicrosoftLibraryAccessors getMicrosoft() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComMicrosoftLibraryAccessors;
        }

        /**
         * Group of libraries at <b>com.openhtmltopdf</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComOpenhtmltopdfLibraryAccessors getOpenhtmltopdf() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComOpenhtmltopdfLibraryAccessors;
        }

        /**
         * Group of libraries at <b>com.sun</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComSunLibraryAccessors getSun() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComSunLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComGoogleLibraryAccessors extends SubDependencyFactory {
        private final ComGoogleCodeLibraryAccessors laccForComGoogleCodeLibraryAccessors = new ComGoogleCodeLibraryAccessors(owner);

        public ComGoogleLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.google.code</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComGoogleCodeLibraryAccessors getCode() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComGoogleCodeLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComGoogleCodeLibraryAccessors extends SubDependencyFactory {
        private final ComGoogleCodeGsonLibraryAccessors laccForComGoogleCodeGsonLibraryAccessors = new ComGoogleCodeGsonLibraryAccessors(owner);

        public ComGoogleCodeLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.google.code.gson</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComGoogleCodeGsonLibraryAccessors getGson() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComGoogleCodeGsonLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComGoogleCodeGsonLibraryAccessors extends SubDependencyFactory {

        public ComGoogleCodeGsonLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>gson</b> with <b>com.google.code.gson:gson</b> coordinates and
         * with version reference <b>com.google.code.gson.gson</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getGson() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("com.google.code.gson.gson");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComMicrosoftLibraryAccessors extends SubDependencyFactory {
        private final ComMicrosoftSqlserverLibraryAccessors laccForComMicrosoftSqlserverLibraryAccessors = new ComMicrosoftSqlserverLibraryAccessors(owner);

        public ComMicrosoftLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.microsoft.sqlserver</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComMicrosoftSqlserverLibraryAccessors getSqlserver() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComMicrosoftSqlserverLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComMicrosoftSqlserverLibraryAccessors extends SubDependencyFactory {
        private final ComMicrosoftSqlserverMssqlLibraryAccessors laccForComMicrosoftSqlserverMssqlLibraryAccessors = new ComMicrosoftSqlserverMssqlLibraryAccessors(owner);

        public ComMicrosoftSqlserverLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.microsoft.sqlserver.mssql</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComMicrosoftSqlserverMssqlLibraryAccessors getMssql() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComMicrosoftSqlserverMssqlLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComMicrosoftSqlserverMssqlLibraryAccessors extends SubDependencyFactory {

        public ComMicrosoftSqlserverMssqlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>jdbc</b> with <b>com.microsoft.sqlserver:mssql-jdbc</b> coordinates and
         * with version reference <b>com.microsoft.sqlserver.mssql.jdbc</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getJdbc() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("com.microsoft.sqlserver.mssql.jdbc");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComOpenhtmltopdfLibraryAccessors extends SubDependencyFactory {
        private final ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors laccForComOpenhtmltopdfOpenhtmltopdfLibraryAccessors = new ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors(owner);

        public ComOpenhtmltopdfLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.openhtmltopdf.openhtmltopdf</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors getOpenhtmltopdf() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComOpenhtmltopdfOpenhtmltopdfLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors extends SubDependencyFactory {

        public ComOpenhtmltopdfOpenhtmltopdfLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>pdfbox</b> with <b>com.openhtmltopdf:openhtmltopdf-pdfbox</b> coordinates and
         * with version reference <b>com.openhtmltopdf.openhtmltopdf.pdfbox</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getPdfbox() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("com.openhtmltopdf.openhtmltopdf.pdfbox");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComSunLibraryAccessors extends SubDependencyFactory {
        private final ComSunMailLibraryAccessors laccForComSunMailLibraryAccessors = new ComSunMailLibraryAccessors(owner);

        public ComSunLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.sun.mail</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComSunMailLibraryAccessors getMail() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComSunMailLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComSunMailLibraryAccessors extends SubDependencyFactory {
        private final ComSunMailJavaxLibraryAccessors laccForComSunMailJavaxLibraryAccessors = new ComSunMailJavaxLibraryAccessors(owner);

        public ComSunMailLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.sun.mail.javax</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComSunMailJavaxLibraryAccessors getJavax() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComSunMailJavaxLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComSunMailJavaxLibraryAccessors extends SubDependencyFactory {

        public ComSunMailJavaxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>mail</b> with <b>com.sun.mail:javax.mail</b> coordinates and
         * with version reference <b>com.sun.mail.javax.mail</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getMail() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("com.sun.mail.javax.mail");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class CommonsLibraryAccessors extends SubDependencyFactory {
        private final CommonsFileuploadLibraryAccessors laccForCommonsFileuploadLibraryAccessors = new CommonsFileuploadLibraryAccessors(owner);
        private final CommonsIoLibraryAccessors laccForCommonsIoLibraryAccessors = new CommonsIoLibraryAccessors(owner);
        private final CommonsLoggingLibraryAccessors laccForCommonsLoggingLibraryAccessors = new CommonsLoggingLibraryAccessors(owner);

        public CommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>commons.fileupload</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public CommonsFileuploadLibraryAccessors getFileupload() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForCommonsFileuploadLibraryAccessors;
        }

        /**
         * Group of libraries at <b>commons.io</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public CommonsIoLibraryAccessors getIo() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForCommonsIoLibraryAccessors;
        }

        /**
         * Group of libraries at <b>commons.logging</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public CommonsLoggingLibraryAccessors getLogging() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForCommonsLoggingLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class CommonsFileuploadLibraryAccessors extends SubDependencyFactory {
        private final CommonsFileuploadCommonsLibraryAccessors laccForCommonsFileuploadCommonsLibraryAccessors = new CommonsFileuploadCommonsLibraryAccessors(owner);

        public CommonsFileuploadLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>commons.fileupload.commons</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public CommonsFileuploadCommonsLibraryAccessors getCommons() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForCommonsFileuploadCommonsLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class CommonsFileuploadCommonsLibraryAccessors extends SubDependencyFactory {

        public CommonsFileuploadCommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>fileupload</b> with <b>commons-fileupload:commons-fileupload</b> coordinates and
         * with version reference <b>commons.fileupload.commons.fileupload</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getFileupload() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("commons.fileupload.commons.fileupload");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class CommonsIoLibraryAccessors extends SubDependencyFactory {
        private final CommonsIoCommonsLibraryAccessors laccForCommonsIoCommonsLibraryAccessors = new CommonsIoCommonsLibraryAccessors(owner);

        public CommonsIoLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>commons.io.commons</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public CommonsIoCommonsLibraryAccessors getCommons() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForCommonsIoCommonsLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class CommonsIoCommonsLibraryAccessors extends SubDependencyFactory {

        public CommonsIoCommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>io</b> with <b>commons-io:commons-io</b> coordinates and
         * with version reference <b>commons.io.commons.io</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getIo() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("commons.io.commons.io");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class CommonsLoggingLibraryAccessors extends SubDependencyFactory {
        private final CommonsLoggingCommonsLibraryAccessors laccForCommonsLoggingCommonsLibraryAccessors = new CommonsLoggingCommonsLibraryAccessors(owner);

        public CommonsLoggingLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>commons.logging.commons</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public CommonsLoggingCommonsLibraryAccessors getCommons() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForCommonsLoggingCommonsLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class CommonsLoggingCommonsLibraryAccessors extends SubDependencyFactory {

        public CommonsLoggingCommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>logging</b> with <b>commons-logging:commons-logging</b> coordinates and
         * with version reference <b>commons.logging.commons.logging</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getLogging() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("commons.logging.commons.logging");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaPlatformLibraryAccessors laccForJakartaPlatformLibraryAccessors = new JakartaPlatformLibraryAccessors(owner);
        private final JakartaServletLibraryAccessors laccForJakartaServletLibraryAccessors = new JakartaServletLibraryAccessors(owner);
        private final JakartaWebsocketLibraryAccessors laccForJakartaWebsocketLibraryAccessors = new JakartaWebsocketLibraryAccessors(owner);
        private final JakartaXmlLibraryAccessors laccForJakartaXmlLibraryAccessors = new JakartaXmlLibraryAccessors(owner);

        public JakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.platform</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaPlatformLibraryAccessors getPlatform() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaPlatformLibraryAccessors;
        }

        /**
         * Group of libraries at <b>jakarta.servlet</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaServletLibraryAccessors getServlet() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaServletLibraryAccessors;
        }

        /**
         * Group of libraries at <b>jakarta.websocket</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaWebsocketLibraryAccessors getWebsocket() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaWebsocketLibraryAccessors;
        }

        /**
         * Group of libraries at <b>jakarta.xml</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaXmlLibraryAccessors getXml() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaXmlLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaPlatformLibraryAccessors extends SubDependencyFactory {
        private final JakartaPlatformJakartaLibraryAccessors laccForJakartaPlatformJakartaLibraryAccessors = new JakartaPlatformJakartaLibraryAccessors(owner);

        public JakartaPlatformLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.platform.jakarta</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaPlatformJakartaLibraryAccessors getJakarta() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaPlatformJakartaLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaPlatformJakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaPlatformJakartaJakartaeeLibraryAccessors laccForJakartaPlatformJakartaJakartaeeLibraryAccessors = new JakartaPlatformJakartaJakartaeeLibraryAccessors(owner);

        public JakartaPlatformJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.platform.jakarta.jakartaee</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaPlatformJakartaJakartaeeLibraryAccessors getJakartaee() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaPlatformJakartaJakartaeeLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaPlatformJakartaJakartaeeLibraryAccessors extends SubDependencyFactory {

        public JakartaPlatformJakartaJakartaeeLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>jakarta.platform:jakarta.jakartaee-api</b> coordinates and
         * with version reference <b>jakarta.platform.jakarta.jakartaee.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getApi() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("jakarta.platform.jakarta.jakartaee.api");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaServletLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspLibraryAccessors laccForJakartaServletJspLibraryAccessors = new JakartaServletJspLibraryAccessors(owner);

        public JakartaServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaServletJspLibraryAccessors getJsp() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaServletJspLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaServletJspLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlLibraryAccessors laccForJakartaServletJspJstlLibraryAccessors = new JakartaServletJspJstlLibraryAccessors(owner);

        public JakartaServletJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaServletJspJstlLibraryAccessors getJstl() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaServletJspJstlLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaServletJspJstlLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlJakartaLibraryAccessors laccForJakartaServletJspJstlJakartaLibraryAccessors = new JakartaServletJspJstlJakartaLibraryAccessors(owner);

        public JakartaServletJspJstlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl.jakarta</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaServletJspJstlJakartaLibraryAccessors getJakarta() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaServletJspJstlJakartaLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaServletJspJstlJakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlJakartaServletLibraryAccessors laccForJakartaServletJspJstlJakartaServletLibraryAccessors = new JakartaServletJspJstlJakartaServletLibraryAccessors(owner);

        public JakartaServletJspJstlJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl.jakarta.servlet</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaServletJspJstlJakartaServletLibraryAccessors getServlet() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaServletJspJstlJakartaServletLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaServletJspJstlJakartaServletLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlJakartaServletJspLibraryAccessors laccForJakartaServletJspJstlJakartaServletJspLibraryAccessors = new JakartaServletJspJstlJakartaServletJspLibraryAccessors(owner);

        public JakartaServletJspJstlJakartaServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl.jakarta.servlet.jsp</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaServletJspJstlJakartaServletJspLibraryAccessors getJsp() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaServletJspJstlJakartaServletJspLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaServletJspJstlJakartaServletJspLibraryAccessors extends SubDependencyFactory {
        private final JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors laccForJakartaServletJspJstlJakartaServletJspJstlLibraryAccessors = new JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors(owner);

        public JakartaServletJspJstlJakartaServletJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.servlet.jsp.jstl.jakarta.servlet.jsp.jstl</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors getJstl() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaServletJspJstlJakartaServletJspJstlLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors extends SubDependencyFactory {

        public JakartaServletJspJstlJakartaServletJspJstlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl-api</b> coordinates and
         * with version reference <b>jakarta.servlet.jsp.jstl.jakarta.servlet.jsp.jstl.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getApi() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("jakarta.servlet.jsp.jstl.jakarta.servlet.jsp.jstl.api");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaWebsocketLibraryAccessors extends SubDependencyFactory {
        private final JakartaWebsocketJakartaLibraryAccessors laccForJakartaWebsocketJakartaLibraryAccessors = new JakartaWebsocketJakartaLibraryAccessors(owner);

        public JakartaWebsocketLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.websocket.jakarta</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaWebsocketJakartaLibraryAccessors getJakarta() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaWebsocketJakartaLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaWebsocketJakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaWebsocketJakartaWebsocketLibraryAccessors laccForJakartaWebsocketJakartaWebsocketLibraryAccessors = new JakartaWebsocketJakartaWebsocketLibraryAccessors(owner);

        public JakartaWebsocketJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.websocket.jakarta.websocket</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaWebsocketJakartaWebsocketLibraryAccessors getWebsocket() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaWebsocketJakartaWebsocketLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaWebsocketJakartaWebsocketLibraryAccessors extends SubDependencyFactory {

        public JakartaWebsocketJakartaWebsocketLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>jakarta.websocket:jakarta.websocket-api</b> coordinates and
         * with version reference <b>jakarta.websocket.jakarta.websocket.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getApi() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("jakarta.websocket.jakarta.websocket.api");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaXmlLibraryAccessors extends SubDependencyFactory {
        private final JakartaXmlBindLibraryAccessors laccForJakartaXmlBindLibraryAccessors = new JakartaXmlBindLibraryAccessors(owner);

        public JakartaXmlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.xml.bind</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaXmlBindLibraryAccessors getBind() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaXmlBindLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaXmlBindLibraryAccessors extends SubDependencyFactory {
        private final JakartaXmlBindJakartaLibraryAccessors laccForJakartaXmlBindJakartaLibraryAccessors = new JakartaXmlBindJakartaLibraryAccessors(owner);

        public JakartaXmlBindLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.xml.bind.jakarta</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaXmlBindJakartaLibraryAccessors getJakarta() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaXmlBindJakartaLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaXmlBindJakartaLibraryAccessors extends SubDependencyFactory {
        private final JakartaXmlBindJakartaXmlLibraryAccessors laccForJakartaXmlBindJakartaXmlLibraryAccessors = new JakartaXmlBindJakartaXmlLibraryAccessors(owner);

        public JakartaXmlBindJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.xml.bind.jakarta.xml</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaXmlBindJakartaXmlLibraryAccessors getXml() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaXmlBindJakartaXmlLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaXmlBindJakartaXmlLibraryAccessors extends SubDependencyFactory {
        private final JakartaXmlBindJakartaXmlBindLibraryAccessors laccForJakartaXmlBindJakartaXmlBindLibraryAccessors = new JakartaXmlBindJakartaXmlBindLibraryAccessors(owner);

        public JakartaXmlBindJakartaXmlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>jakarta.xml.bind.jakarta.xml.bind</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JakartaXmlBindJakartaXmlBindLibraryAccessors getBind() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJakartaXmlBindJakartaXmlBindLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JakartaXmlBindJakartaXmlBindLibraryAccessors extends SubDependencyFactory {

        public JakartaXmlBindJakartaXmlBindLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>jakarta.xml.bind:jakarta.xml.bind-api</b> coordinates and
         * with version reference <b>jakarta.xml.bind.jakarta.xml.bind.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getApi() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("jakarta.xml.bind.jakarta.xml.bind.api");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheLibraryAccessors laccForOrgApacheLibraryAccessors = new OrgApacheLibraryAccessors(owner);
        private final OrgGlassfishLibraryAccessors laccForOrgGlassfishLibraryAccessors = new OrgGlassfishLibraryAccessors(owner);
        private final OrgJsonLibraryAccessors laccForOrgJsonLibraryAccessors = new OrgJsonLibraryAccessors(owner);

        public OrgLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.apache</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgApacheLibraryAccessors getApache() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgApacheLibraryAccessors;
        }

        /**
         * Group of libraries at <b>org.glassfish</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgGlassfishLibraryAccessors getGlassfish() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgGlassfishLibraryAccessors;
        }

        /**
         * Group of libraries at <b>org.json</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgJsonLibraryAccessors getJson() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgJsonLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgApacheLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheHttpcomponentsLibraryAccessors laccForOrgApacheHttpcomponentsLibraryAccessors = new OrgApacheHttpcomponentsLibraryAccessors(owner);

        public OrgApacheLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.apache.httpcomponents</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgApacheHttpcomponentsLibraryAccessors getHttpcomponents() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgApacheHttpcomponentsLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgApacheHttpcomponentsLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheHttpcomponentsFluentLibraryAccessors laccForOrgApacheHttpcomponentsFluentLibraryAccessors = new OrgApacheHttpcomponentsFluentLibraryAccessors(owner);

        public OrgApacheHttpcomponentsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>httpclient</b> with <b>org.apache.httpcomponents:httpclient</b> coordinates and
         * with version reference <b>org.apache.httpcomponents.httpclient</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getHttpclient() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("org.apache.httpcomponents.httpclient");
        }

        /**
         * Dependency provider for <b>httpcore</b> with <b>org.apache.httpcomponents:httpcore</b> coordinates and
         * with version reference <b>org.apache.httpcomponents.httpcore</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getHttpcore() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("org.apache.httpcomponents.httpcore");
        }

        /**
         * Group of libraries at <b>org.apache.httpcomponents.fluent</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgApacheHttpcomponentsFluentLibraryAccessors getFluent() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgApacheHttpcomponentsFluentLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgApacheHttpcomponentsFluentLibraryAccessors extends SubDependencyFactory {

        public OrgApacheHttpcomponentsFluentLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>hc</b> with <b>org.apache.httpcomponents:fluent-hc</b> coordinates and
         * with version reference <b>org.apache.httpcomponents.fluent.hc</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getHc() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("org.apache.httpcomponents.fluent.hc");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgGlassfishLibraryAccessors extends SubDependencyFactory {
        private final OrgGlassfishWebLibraryAccessors laccForOrgGlassfishWebLibraryAccessors = new OrgGlassfishWebLibraryAccessors(owner);

        public OrgGlassfishLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.glassfish.web</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgGlassfishWebLibraryAccessors getWeb() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgGlassfishWebLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgGlassfishWebLibraryAccessors extends SubDependencyFactory {
        private final OrgGlassfishWebJakartaLibraryAccessors laccForOrgGlassfishWebJakartaLibraryAccessors = new OrgGlassfishWebJakartaLibraryAccessors(owner);

        public OrgGlassfishWebLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.glassfish.web.jakarta</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgGlassfishWebJakartaLibraryAccessors getJakarta() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgGlassfishWebJakartaLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgGlassfishWebJakartaLibraryAccessors extends SubDependencyFactory {
        private final OrgGlassfishWebJakartaServletLibraryAccessors laccForOrgGlassfishWebJakartaServletLibraryAccessors = new OrgGlassfishWebJakartaServletLibraryAccessors(owner);

        public OrgGlassfishWebJakartaLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.glassfish.web.jakarta.servlet</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgGlassfishWebJakartaServletLibraryAccessors getServlet() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgGlassfishWebJakartaServletLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgGlassfishWebJakartaServletLibraryAccessors extends SubDependencyFactory {
        private final OrgGlassfishWebJakartaServletJspLibraryAccessors laccForOrgGlassfishWebJakartaServletJspLibraryAccessors = new OrgGlassfishWebJakartaServletJspLibraryAccessors(owner);

        public OrgGlassfishWebJakartaServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.glassfish.web.jakarta.servlet.jsp</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgGlassfishWebJakartaServletJspLibraryAccessors getJsp() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgGlassfishWebJakartaServletJspLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgGlassfishWebJakartaServletJspLibraryAccessors extends SubDependencyFactory {

        public OrgGlassfishWebJakartaServletJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>jstl</b> with <b>org.glassfish.web:jakarta.servlet.jsp.jstl</b> coordinates and
         * with version reference <b>org.glassfish.web.jakarta.servlet.jsp.jstl</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getJstl() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("org.glassfish.web.jakarta.servlet.jsp.jstl");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgJsonLibraryAccessors extends SubDependencyFactory {

        public OrgJsonLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>json</b> with <b>org.json:json</b> coordinates and
         * with version reference <b>org.json.json</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getJson() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
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

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class BundleAccessors extends BundleFactory {

        public BundleAccessors(ObjectFactory objects, ProviderFactory providers, DefaultVersionCatalog config, ImmutableAttributesFactory attributesFactory, CapabilityNotationParser capabilityNotationParser) { super(objects, providers, config, attributesFactory, capabilityNotationParser); }

    }

    public static class PluginAccessors extends PluginFactory {

        public PluginAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

    }

}
