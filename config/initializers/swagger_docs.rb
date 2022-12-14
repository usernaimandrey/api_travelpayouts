# frozen_string_literal: true

Swagger::Docs::Config.register_apis({
                                      '1.0' => {
                                        # the extension used for the API
                                        api_extension_type: :json,
                                        # the output location where your .json files are written to
                                        api_file_path: 'public/api/v1/',
                                        # the URL base path to your API
                                        base_path: 'http://localhost:3000/api/v1',
                                        # if you want to delete all .json files at each generation
                                        clean_directory: false,
                                        # Ability to setup base controller for each api version. Api::V1::SomeController for example.
                                        parent_controller: Api::V1::ApplicationController,
                                        # add custom attributes to api-docs
                                        attributes: {
                                          info: {
                                            'title' => 'api_travel',
                                            'description' => 'This is api for avia sales.',
                                            'termsOfServiceUrl' => 'http://helloreverb.com/terms/',
                                            'contact' => 'anshlyapnikov@gmail.com',
                                            'license' => 'Apache 2.0',
                                            'licenseUrl' => 'http://www.apache.org/licenses/LICENSE-2.0.html'
                                          }
                                        }
                                      }
                                    })
